<?php
/**
 * DokuWiki Default Template
 *
 * This is the template you need to change for the overall look
 * of DokuWiki.
 *
 * You should leave the doctype at the very top - It should
 * always be the very first line of a document.
 *
 * @link   http://wiki.splitbrain.org/wiki:tpl:templates
 * @author Andreas Gohr <andi@splitbrain.org>
 * Adjusted for the "Beaufort" Dokuwiki template by Rolf Deenen
 */

// must be run from within DokuWiki
@require_once(dirname(__FILE__).'/functions.php');
tpl_checkColor();
$color = tpl_getConf('color');



if (!defined('DOKU_INC')) die();

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $conf['lang']?>"
 lang="<?php echo $conf['lang']?>" dir="<?php echo $lang['direction']?>">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>
    <?php tpl_pagetitle()?>
    [<?php echo strip_tags($conf['title'])?>]
  </title>

  <?php tpl_metaheaders()?>

<link rel="shortcut icon" href="<?php echo DOKU_TPL?>images/favicon_sunshine.ico" />

  <?php /*old includehook*/ @include(dirname(__FILE__).'/meta.html')?>
</head>

<body>
<?php /*old includehook*/ @include(dirname(__FILE__).'/topheader.html')?>
<div class="dokuwiki">
  <?php html_msgarea()?>
  <div class="stylehead">
    <div class="header">
      <div class="clearer"></div>
    </div>
    <div class="pagefunctionsright">




<div class="menu">
<ul>
<li><a class="hide" href=#>Site Menu</a>
<!--[if IE6]>
	<a class="hide" href=#>Site Menu
	<table><tr><td>
<![endif]-->
	<ul>
	<li><?php tpl_actionlink('admin'); if($INFO['ismanager']);?></li>
	<li><?php tpl_actionlink('login');?></li>
	<li><?php tpl_actionlink('profile');?></li>
	<li><?php tpl_actionlink('recent');?></li>
	<li><?php tpl_actionlink('index');?></li>
	</ul>
<!--[if IE 6]>
</td></tr></table>
</a>
<![endif]-->
</li>
</ul>
</div>
</div>


    <div class="pagefunctionsleft">
      <?php tpl_actionlink('edit');  echo " | "; 
      tpl_actionlink('history');  echo " | "; 
      tpl_actionlink('backlink');?>
    </div>
    <?php /*old includehook*/ @include(dirname(__FILE__).'/header.html')?>

    <div class="bar">
      <div class="logo">
      <?php tpl_link(wl(),$conf['title'],'name="dokuwiki__top" id="dokuwiki__top" accesskey="h" title="[ALT+H]"')?><br>
      <div class="pagename">
        &#8226;&nbsp;<?php echo $ID?>
      </div>
    </div>
    <div class="rssicon">
       <a <?php echo $tgt?> href="<?php echo DOKU_BASE; ?>feed.php" title="Recent changes RSS feed"><img src="<?php echo DOKU_TPL; ?>images/button-rss.png" alt="Recent changes RSS feed" /></a>
    </div>
    <br>
    <div class="bar-right">
      <?php tpl_searchform()?>&nbsp;
</form>

	</div>
    <div class="clearer"></div>
  </div>

  <?php if($conf['breadcrumbs']){?>
  <div class="breadcrumbs">
    <?php tpl_breadcrumbs()?>
    <?php //tpl_youarehere() //(some people prefer this)?>
  </div>
  <?php }?>
  <?php if($conf['youarehere']){?>
  <div class="breadcrumbs">
    <?php tpl_youarehere() ?>
  </div>
  <?php }?>
</div>

<?php flush()?>

  <?php /*old includehook*/ @include(dirname(__FILE__).'/pageheader.html')?>
  <div class="page">
    <!-- wikipage start -->
    <?php tpl_content()?>
    <!-- wikipage stop -->
</div>

  <div class="clearer">&nbsp;</div>

  <?php flush()?>

  <div class="stylefoot">

    <div class="meta">
      <div class="user">
        <?php tpl_userinfo()?>
      </div>
      <div class="doc">
        <?php tpl_pageinfo()?>
      </div>
    </div>

   <?php /*old includehook*/ @include(dirname(__FILE__).'/pagefooter.html')?>

    <div class="bar" id="bar__bottom">
      <div class="bar-left" id="bar__bottomleft">
      </div>
      <div class="bar-right" id="bar__bottomright">



</div>
      <div class="clearer"></div>
    </div>

  <div class="pagefunctionsleft">
  <?php tpl_actionlink('edit');  echo " | ";
  tpl_actionlink('history');  echo " | ";
  tpl_actionlink('backlink');?>
  </div>

  </div>

</div>
<?php /*old includehook*/ @include(dirname(__FILE__).'/footer.html')?>

<div class="no"><?php /* provide DokuWiki housekeeping, required in all templates */ tpl_indexerWebBug()?></div>
</body>
</html>
