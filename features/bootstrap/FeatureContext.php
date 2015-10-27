<?php

use Behat\Behat\Tester\Exception\PendingException;
use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\RawMinkContext;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawMinkContext implements SnippetAcceptingContext
{
    /**
     * @Then I wait for a while
     */
    public function iWaitForAWhile()
    {
        $this->getSession()->wait(1000);
    }

    /**
     * @When I fill in text editor :arg1 with :arg2
     */
    public function iFillInTextEditorWith($arg1, $arg2)
    {
		$arg1 = "company_content";
		$this->getSession()->executeScript("CKEDITOR.instances.$arg1.setData(\"$arg2\");");
    }

    /**
     * @Then I wait for :arg1 seconds
     */
    public function iWaitForSeconds( $arg1 )
    {
		$this->getSession()->wait( $arg1 * 1000 );
    }

    /**
     * @Then I should be at URL :arg1
     */
    public function iShouldBeAtUrl( $arg1 )
    {
		$givenURL = 'http://fram-dev.local'.$arg1;
		$currentURL = $this->getSession()->getCurrentUrl();

		if ( $currentURL == $givenURL ) {
			return;
		} else {
			throw new Exception(
				sprintf( "It should be at %s not at %s", $givenURL, $currentURL )
			);
		}
    }

	/**
	 * @When I fill in job text editor :arg1
	 */
	public function iFillInJobTextEditor( $arg1 )
	{
		$jobEditor = "job_content";
		$this->getSession()->executeScript("CKEDITOR.instances.$jobEditor.setData(\"$arg1\");");
	}

	/**
	 * @When I should be at edit company page
	 */
	public function iShouldBeAtEditCompanyPage()
	{
		$companyEditURL = $this->getSession()->getCurrentUrl();

		if ( strpos( $companyEditURL, "/user-admin/bedrift/edit/" ) )
		{
			return;
		} else {
			throw new Exception( "Given URL is not company edit URL" );
		}
	}

	/**
	 * @When I should be at edit employee page
	 */
	public function iShouldBeAtEditEmployeePage()
	{
		$employeeEditURL = $this->getSession()->getCurrentUrl();

		if ( strpos( $employeeEditURL, "/user-admin/arbeidssokar/edit/" ) )
		{
			return;
		} else {
			throw new Exception( "Given URL is not employee edit URL" );
		}
	}

	/**
	 * @When I upload the file :arg1 to :arg2
	 */
	public function iUploadTheFileTo( $arg1, $arg2 )
	{
		if ( $this->getMinkParameter('files_path') ) {
			$fullPath = rtrim( realpath( $this->getMinkParameter('files_path') ), DIRECTORY_SEPARATOR ).DIRECTORY_SEPARATOR.$arg1;

			if ( is_file( $fullPath ) ) {
				$field = $this->getSession()->getPage()->findById( $arg2 );

				if ( null === $field ) {
					throw new Exception("File input is not found");
				}
				$field->attachFile( $fullPath );
			}
		}
		else throw new Exception( "File is not found at the given location" );
	}
}
