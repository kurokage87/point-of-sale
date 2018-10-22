<?php

namespace app\controllers;

use Yii;
use app\models\Penjualan;
use app\models\searchModel\PenjualanSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * PenjualanController implements the CRUD actions for Penjualan model.
 */
class PenjualanController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Penjualan models.
     * @return mixed
     */
    
    public function actionIndex()
    {
        $searchModel = new PenjualanSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Penjualan model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Penjualan model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Penjualan();
        $modelDetailJuals = [];
        $nilai = Penjualan::find()->max('id');         
        $model->no_faktur = "MHKT". date('dmY').sprintf("%05s", $nilai+1);
        $model->user_id = \Yii::$app->user->identity->id;
       
        $formDetails = \Yii::$app->request->post('DetailJual', []);
        
        foreach ($formDetails as $i => $formDetail) {
            $modelDetailJual = new \app\models\DetailJual(['scenario' => \app\models\DetailJual::SCENARIO_BATCH_UPDATE]);
            $modelDetailJual->setAttributes($formDetail);
            $modelDetailJuals[] = $modelDetailJual;
        }
        
        if (\Yii::$app->request->post('addRow') == 'true'){
            $model->load(\Yii::$app->request->post());
            
            $modelDetailJuals[] = new \app\models\DetailJual(['scenario' => \app\models\DetailJual::SCENARIO_BATCH_UPDATE]);
            return $this->render('create', [
                'model' => $model,
                'modelDetailJuals' => $modelDetailJuals
            ]);
        }
        
        if ($model->load(\Yii::$app->request->post())){
            if (\yii\base\Model::validateMultiple($modelDetailJuals) && $model->validate()){
                $model->save();
                foreach ($modelDetailJuals as $modelDetailJual) {
                    $modelDetailJual->penjualan_id = $model->id;
                    $modelDetailJual->save();
                    
                }
                return $this->redirect(['view', 'id' => $model->id]);
            }
        }
        
//        if ($model->load(Yii::$app->request->post('addRow')) == 'true') {
//            $model
//            return $this->redirect(['view', 'id' => $model->id]);
//        }
        
        return $this->render('create', [
            'model' => $model,
            'modelDetailJuals' => $modelDetailJuals
        ]);
    }

    /**
     * Updates an existing Penjualan model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $modelDetailJuals = $model->detailJuals;
        
        $formDetails = \Yii::$app->request->post('DetailJual', []);
        
        foreach ($formDetails as $i => $formDetail) {
            if (isset($formDetail['id']) && isset($formDetail['updateType']) && $formDetail['updateType'] != \app\models\DetailJual::UPDATE_TYPE_CREATE){
            $modelDetailJual = \app\models\DetailJual::findOne(['id' => $formDetail['id'], 'penjualan_id' => $model->id]);
            $modelDetailJual->setScenario(\app\models\DetailJual::SCENARIO_BATCH_UPDATE);
            $modelDetailJual->setAttributes($formDetail);
            $modelDetailJuals[$i] = $modelDetailJual;
            }else{
                $modelDetailJual = new \app\models\DetailJual(['scenario' => \app\models\DetailJual::SCENARIO_BATCH_UPDATE]);
                $modelDetailJual->setAttributes($formDetail);
                $modelDetailJuals[] = $modelDetailJual;
            }
        }
        
        if (\Yii::$app->request->post('addRow') == 'true'){
            $modelDetailJuals[] = new \app\models\DetailJual(['scenario' => \app\models\DetailJual::SCENARIO_BATCH_UPDATE]);
            return $this->render('update',[
                'model' => $model,
                'modelDetailJuals' => $modelDetailJuals
            ]);
        }
        
        if ($model->load(\Yii::$app->request->post())){
            if (\yii\base\Model::validateMultiple($modelDetailJuals) && $model->validate()){
                $model->save();
                foreach ($modelDetailJuals as $modelDetailJual) {
                    if ($modelDetailJual->updateType == \app\models\DetailJual::UPDATE_TYPE_DELETE) {
                        $modelDetailJual->delete();
                    }else{
                        $modelDetailJual->penjualan_id = $model->id;
                        $modelDetailJual->save();
                    }
                }
                return $this->redirect(['view', 'id' => $model->id]);
            }
        }
        
//        if ($model->load(Yii::$app->request->post()) && $model->save()) {
//            return $this->redirect(['view', 'id' => $model->id]);
//        }

        return $this->render('update', [
            'model' => $model,
            'modelDetailJuals' => $modelDetailJuals
        ]);
    }

    /**
     * Deletes an existing Penjualan model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Penjualan model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Penjualan the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Penjualan::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
