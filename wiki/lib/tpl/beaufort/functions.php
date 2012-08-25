<?php 
/**
 * Return the correct ID for <div class="dokuwiki">
 */

/**
 * Checks if the color scheme has changed
 */
function tpl_checkColor(){
  $color = tpl_getConf('color');

$file  = DOKU_TPLINC.'style.ini';
  $file2 = DOKU_TPLINC.'style_'.$color.'.ini';
  $ini   = parse_ini_file($file);

  if ($ini['__theme__'] != '_'.$color){
    if ((@file_exists($file2)) && (@unlink($file)) && (@copy($file2, $file))){
      global $conf;
      if ($conf['fperm']) chmod($file, $conf['fperm']);
    } else {
      msg('Could not set correct style.ini file for your chosen color scheme.', -1);
    }
  }
}

