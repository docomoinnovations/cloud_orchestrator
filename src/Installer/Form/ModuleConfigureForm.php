<?php

namespace Drupal\cloud_orchestrator\Installer\Form;

use Drupal\Core\Config\ConfigFactoryInterface;
use Drupal\Core\Form\ConfigFormBase;
use Drupal\Core\Form\FormStateInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

class ModuleConfigureForm extends ConfigFormBase {

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'cloud_orchestrator_module_configure_form';
  }

  /**
   * {@inheritdoc}
   */
  protected function getEditableConfigNames() {
    return [];
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    $form = parent::buildForm($form, $form_state);
    $form['#title'] = 'Additional configurations';

    $form['install_ldap'] = [
      '#type' => 'checkbox',
      '#title' => $this->t('Install LDAP modules'),
      '#description' => $this->t('Install LDAP modules to authenticate with Active Directory.  LDAP can also be installed at a later time.'),
    ];

    $form['actions']['submit']['#value'] = $this->t('Save and continue');

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    if ($form_state->getValue('install_ldap') == TRUE) {
      // Install the LDAP modules.
      /** @var \Drupal\Core\Extension\ModuleInstallerInterface $installer */
      $installer = \Drupal::service('module_installer');
      $installer->install([
        'ldap_user',
        'ldap_servers',
        'ldap_authorization',
        'ldap_query',
        'ldap_authorization',
        'ldap_authentication',
        'authorization',
        'externalauth',
      ], TRUE);
    }
  }
}