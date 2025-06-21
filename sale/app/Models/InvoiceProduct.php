<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Product;
class InvoiceProduct extends Model
{
    protected $fillable = [
        'invoice_id',
        'product_id',
        'user_id',
        'qty',
        'sale_price',
    ];

    public function product(){
        return $this->belongsTo(Product::class);
    }
}
