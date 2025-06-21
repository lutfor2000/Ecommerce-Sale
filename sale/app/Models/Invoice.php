<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

use App\Models\Customer;
use App\Models\InvoiceProduct;
class Invoice extends Model
{
    protected $fillable = [
        'user_id',
        'customer_id',
        'total',
        'vat',
        'payable',
        'discount'
    ];

    public function customer(){
        return $this->belongsTo(Customer::class);
    }//end method

    public function invoiceProduct(){
        return $this->hasMany(InvoiceProduct::class);
    }

}
