<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "beli_supplier".
 *
 * @property int $id
 * @property string $no_faktur
 * @property string $tgl_beli
 * @property int $supplier_id
 * @property string $kode_pembelian
 *
 * @property Supplier $supplier
 * @property DetailBeliSupplier[] $detailBeliSuppliers
 */
class BeliSupplier extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'beli_supplier';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['tgl_beli'], 'safe'],
            [['supplier_id'], 'integer'],
            [['no_faktur', 'kode_pembelian'], 'string', 'max' => 255],
            [['supplier_id'], 'exist', 'skipOnError' => true, 'targetClass' => Supplier::className(), 'targetAttribute' => ['supplier_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'no_faktur' => 'No Faktur',
            'tgl_beli' => 'Tgl Beli',
            'supplier_id' => 'Supplier ID',
            'kode_pembelian' => 'Kode Pembelian',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSupplier()
    {
        return $this->hasOne(Supplier::className(), ['id' => 'supplier_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDetailBeliSuppliers()
    {
        return $this->hasMany(DetailBeliSupplier::className(), ['beli_sup_id' => 'id']);
    }
}
