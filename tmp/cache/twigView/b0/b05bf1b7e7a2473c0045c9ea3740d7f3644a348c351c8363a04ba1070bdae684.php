<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;

/* E:\srv\home\webelement\vendor\cakephp\bake\src\Template\Bake\\View\helper.twig */
class __TwigTemplate_ddd574835fbdebe7a4c8183b6048641cc2d8fe7b723da92804d2603e6cb6335c extends \Twig\Template
{
    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = [
        ];
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $__internal_770edd655cdeb606afc443e4edb1f19b4248a91788cb82e88bf8b9495a7c5cfa = $this->env->getExtension("WyriHaximus\\TwigView\\Lib\\Twig\\Extension\\Profiler");
        $__internal_770edd655cdeb606afc443e4edb1f19b4248a91788cb82e88bf8b9495a7c5cfa->enter($__internal_770edd655cdeb606afc443e4edb1f19b4248a91788cb82e88bf8b9495a7c5cfa_prof = new \Twig\Profiler\Profile($this->getTemplateName(), "template", "E:\\srv\\home\\webelement\\vendor\\cakephp\\bake\\src\\Template\\Bake\\\\View\\helper.twig"));

        // line 16
        echo "<?php
namespace ";
        // line 17
        echo twig_escape_filter($this->env, ($context["namespace"] ?? null), "html", null, true);
        echo "\\View\\Helper;

use Cake\\View\\Helper;
use Cake\\View\\View;

/**
 * ";
        // line 23
        echo twig_escape_filter($this->env, ($context["name"] ?? null), "html", null, true);
        echo " helper
 */
class ";
        // line 25
        echo twig_escape_filter($this->env, ($context["name"] ?? null), "html", null, true);
        echo "Helper extends Helper
{
    /**
     * Default configuration.
     *
     * @var array
     */
    protected \$_defaultConfig = [];

}
";
        
        $__internal_770edd655cdeb606afc443e4edb1f19b4248a91788cb82e88bf8b9495a7c5cfa->leave($__internal_770edd655cdeb606afc443e4edb1f19b4248a91788cb82e88bf8b9495a7c5cfa_prof);

    }

    public function getTemplateName()
    {
        return "E:\\srv\\home\\webelement\\vendor\\cakephp\\bake\\src\\Template\\Bake\\\\View\\helper.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  50 => 25,  45 => 23,  36 => 17,  33 => 16,);
    }

    /** @deprecated since 1.27 (to be removed in 2.0). Use getSourceContext() instead */
    public function getSource()
    {
        @trigger_error('The '.__METHOD__.' method is deprecated since version 1.27 and will be removed in 2.0. Use getSourceContext() instead.', E_USER_DEPRECATED);

        return $this->getSourceContext()->getCode();
    }

    public function getSourceContext()
    {
        return new Source("{#
/**
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @since         2.0.0
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */
#}
<?php
namespace {{ namespace }}\\View\\Helper;

use Cake\\View\\Helper;
use Cake\\View\\View;

/**
 * {{ name }} helper
 */
class {{ name }}Helper extends Helper
{
    /**
     * Default configuration.
     *
     * @var array
     */
    protected \$_defaultConfig = [];

}
", "E:\\srv\\home\\webelement\\vendor\\cakephp\\bake\\src\\Template\\Bake\\\\View\\helper.twig", "E:\\srv\\home\\webelement\\vendor\\cakephp\\bake\\src\\Template\\Bake\\\\View\\helper.twig");
    }
}
