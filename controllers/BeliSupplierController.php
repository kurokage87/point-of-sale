<?php

namespace app\controllers;

use Yii;
use app\models\BeliSupplier;
use app\models\searchModel\BeliSupplierSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * BeliSupplierController implements the CRUD actions for BeliSupplier model.
 */
class BeliSupplierController extends Controller
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
     * Lists all BeliSupplier models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new BeliSupplierSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single BeliSupplier model.
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
     * Creates a new BeliSupplier model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new BeliSupplier();
        $supplier = \app\models\Supplier::find()->where(['user_id' => \Yii::$app->user->identity->id])->one();
        if ($supplier == null)
        {
            \Yii::$app->session->getFlash('Silahkan Isi Formulir Profil Supplier');
            return $this->redirect(['supplier/create']);
        }else{
            $model->supplier_id = $supplier->id;
        }
        
        $faktur = BeliSupplier::find()->max('id');
        $model->no_faktur = "MHKTSUP".date('dmY'). sprintf("%05s", $faktur+1);
        $model->kode_pembelian = "KDBELI".sprintf("%05s", $faktur+1);
        
        $modelDetailBelis = [];
        $formDetails = \Yii::$app->request->post('DetailBeliSupplier',[]);
        
        foreach ($formDetails as $i => $formDetail) {
            $modelDetailBeli = new \app\models\DetailBeliSupplier(['scenario' => \app\models\DetailBeliSupplier::SCENARIO_BATCH_UPDATE]);
            $modelDetailBeli->setAttributes($formDetail);
            $modelDetailBelis[] = $modelDetailBeli;
        }
        
        if (\Yii::$app->request->post('addRow') == true){
            $model->load(\Yii::$app->request->post());
            
            $modelDetailBelis[] = new \app\models\DetailBeliSupplier(['scenario' => \app\models\DetailBeliSupplier::SCENARIO_BATCH_UPDATE]);
            return $this->render('create',[
                'model' => $model,
                'modelDetailBelis' => $modelDetailBelis
            ]);
        }
        
        if ($model->load(Yii::$app->request->post())) {
            if (\yii\base\Model::validateMultiple($modelDetailBelis) && $model->validate()){
                $model->save();
                foreach ($modelDetailBelis as $modelDetailBeli) {
                    $modelDetailBeli->beli_sup_id = $model->id;
                    $modelDetailBeli->save();
                }
                return $this->redirect(['view', 'id' => $model->id]);
            }
        }

        return $this->render('create', [
            'model' => $model,
            'modelDetailBelis' => $modelDetailBelis
        ]);
    }

    /**
     * Updates an existing BeliSupplier model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $modelDetailBelis = $model->detailBeliSuppliers;
        
        $formDetails = \Yii::$app->request->post('DetailBeliSupplier', []);
        
        foreach ($formDetails as $i => $formDetail) {
            if (isset($formDetail['id']) && isset($formDetail['updateType']) && $formDetail['updateType'] != \app\models\DetailBeliSupplier::UPDATE_TYPE_CREATE){
            $modelDetailBeli = \app\models\DetailBeliSupplier::findOne(['id' => $formDetail['id'], 'beli_sup_id' => $model->id]);
            $modelDetailBeli->setScenario(\app\models\DetailBeliSupplier::SCENARIO_BATCH_UPDATE);
            $modelDetailBeli->setAttributes($formDetail);
            $modelDetailBelis[$i] = $modelDetailBeli;
            }else{
                $modelDetailBeli = new \app\models\DetailBeliSupplier(['scenario' => \app\models\DetailBeliSupplier::SCENARIO_BATCH_UPDATE]);
                $modelDetailBeli->setAttributes($formDetail);
                $modelDetailBelis[] = $modelDetailBeli;
            }
        }
        
        if (\Yii::$app->request->post('addRow') == true){
            $modelDetailBelis[] = new \app\models\DetailBeliSupplier(['scenario' => \app\models\DetailBeliSupplier::SCENARIO_BATCH_UPDATE]);
            return $this->render('update',[
                'model' => $model,
                'modelDetailBelis' => $modelDetailBelis
            ]);
        }

        if ($model->load(Yii::$app->request->post())) {
            if (\yii\base\Model::validateMultiple($modelDetailBelis) && $model->validate()){
                $model->save();
                foreach ($modelDetailBelis as $$modelDetailBeli) {
                    if ($modelDetailBeli->updateType == \app\models\DetailBeliSupplier::UPDATE_TYPE_DELETE){
                        $modelDetailBeli->delete();
                    }else{
                        $modelDetailBeli->beli_sup_id = $model->id;
                        $modelDetailBeli->save();
                    }
                }
                return $this->redirect(['view', 'id' => $model->id]);
            }
        }

        return $this->render('update', [
            'model' => $model,
            'modelDetailBelis' => $modelDetailBelis
        ]);
    }

    /**
     * Deletes an existing BeliSupplier model.
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
     * Finds the BeliSupplier model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return BeliSupplier the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = BeliSupplier::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
