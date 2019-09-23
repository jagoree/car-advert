<?php

namespace App\View\Helper;

use Cake\View\Helper\FormHelper;

/**
 * MyForm helper
 */
class AdvancedFormHelper extends FormHelper
{

    public function control($fieldName, array $options = [])
    {
        if (!isset($options['class'])) {
            $options['class'] = 'form-control';
        }
        return parent::control($fieldName, $options);
    }

}
