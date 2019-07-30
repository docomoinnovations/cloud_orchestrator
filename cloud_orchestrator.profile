<?php

use Drupal\Core\Form\FormStateInterface;

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function cloud_orchestrator_form_install_configure_form_alter(&$form, FormStateInterface $form_state) {
  // Add a placeholder as example that one can choose an arbitrary site name.
  $form['site_information']['site_name']['#default_value'] = t('Cloud Orchestrator');

  // user 1's account name
//  $form['admin_account']['account']['name']['#default_value'] = 'super_admin';
//  $form['admin_account']['account']['name']['#value'] = 'super_admin';
//  $form['admin_account']['account']['name']['#attributes']['disabled'] = TRUE;
}

/**
 * Implements hook_install_tasks().
 */
function cloud_orchestrator_install_tasks() {
  $tasks = [
    'cloud_orchestrator_module_configure_form' => [
      'display_name' => t('Additional configurations'),
      'type' => 'form',
      'function' => 'Drupal\cloud_orchestrator\Installer\Form\ModuleConfigureForm',
    ],
  ];
  return $tasks;
}

/**
 * Implements hook_install_tasks_alter().
 */
function cloud_orchestrator_install_tasks_alter(array &$tasks, array $install_state) {
  $tasks['install_finished']['function'] = 'cloud_orchestrator_after_install_finished';
}

/**
 * Redirect to cloud_config add form after installer finishes.
 *
 * @param array $install_state
 *   The current install state.
 *
 * @return array
 *   A renderable array with a redirect header.
 */

function cloud_orchestrator_after_install_finished(array &$install_state) {
  global $base_url;
  $add_cloud_config_url = $base_url . '/admin/structure/cloud_config';
  install_finished($install_state);

  $output = [];

  // Clear all messages.
  drupal_get_messages();

  $output = [
    '#title' => t('Cloud Orchestrator'),
    'info' => [
      '#markup' => t('<p>Congratulations, you have installed Cloud Orchestrator!</p><p>If you are not redirected to the front page in 5 seconds, Please <a href="@url">click here</a> to proceed to your installed site.</p>', [
        '@url' => $add_cloud_config_url,
      ]),
    ],
    '#attached' => [
      'http_header' => [
        ['Cache-Control', 'no-cache'],
      ],
    ],
  ];

  $meta_redirect = [
    '#tag' => 'meta',
    '#attributes' => [
      'http-equiv' => 'refresh',
      'content' => '0;url=' . $add_cloud_config_url,
    ],
  ];
  $output['#attached']['html_head'][] = [$meta_redirect, 'meta_redirect'];

  return $output;


}