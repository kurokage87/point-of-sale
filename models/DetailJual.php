<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "detail_jual".
 *
 * @property int $id
 * @property int $penjualan_id
 * @property int $barang_id
 * @property int $qty
 * @property double $total
 *
 * @property Barang $barang
 * @property Penjualan $penjualan
 */
class DetailJual extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'detail_jual';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['penjualan_id', 'barang_id', 'qty'], 'integer'],
            [['total'], 'number'],
            [['barang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Barang::className(), 'targetAttribute' => ['barang_id' => 'id']],
            [['penjualan_id'], 'exist', 'skipOnError' => true, 'targetClass' => Penjualan::className(), 'targetAttribute' => ['penjualan_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'penjualan_id' => 'Penjualan ID',
            'barang_id' => 'Barang ID',
            'qty' => 'Qty',
            'total' => 'Total',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBarang()
    {
        return $this->hasOne(Barang::className(), ['id' => 'barang_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPenjualan()
    {
        return $this->hasOne(Penjualan::className(), ['id' => 'penjualan_id']);
    }
}
