Feature: Register company
    In order to register company
    As a website user
    I need to be able to open company form, fill in and submit data

    Scenario: Check for page with register company form
        Given I am on homepage
        When I follow "Registrering for Bedrifter"
        Then I should see "Registrer bedrifta di på Framtidsfylket"

    @javascript @register
    Scenario: Fill data in
        Given I am on "/registrer-bedrift"
        # First page
        When I fill in "Namnet til bedrifta" with "Netgen Company"
        And I fill in "Postaadresse" with "Zupanici 2J"
        And I fill in "Postnr." with "10000"
        And I fill in "Poststad" with "Zagreb"
        And I fill in "Fakturanamn" with "Netgen Company"
        And I fill in "company_invoiceZip" with "10000"
        And I fill in "company_invoiceCity" with "Zagreb"
        And I fill in "Fakturaadresse" with "Zupanici 2J"
        And I fill in "Epost til fakturamottak" with "faktura@netgen-company.com"
        And I wait for a while
        And I select "1" from "company[numemployee]"
        And I attach the file "logo.jpeg" to "company_logoFile_file"
        And I fill in "E-post for innlogging" with "user@netgen-company.com"
        And I fill in "Passord" with "test"
        And I fill in "Stadfest passord" with "test"
        And I press "Gå til kontaktinformasjon"
        # Second page
        And I fill in "Telefon" with "01 555-3212"
        And I fill in "Nettstad (website):" with "www.netgen-company.com"
        And I fill in "Bedriftas epostadresse" with "info@netgen-company.com"
        And I fill in "E-post HR/personalansvalig" with "hr@netgen-company.com"
        And I check "company_jobmatchemail"
        And I check "company_regiontags_1"
        And I check "company_regiontags_3"
        And I select "Handverk/bygg/anlegg/mekanikk" from "company_mainindustrytags"
        And I check "company_jobtypes_1"
        And I check "company_jobtypes_2"
        And I check "company_jobtypes_3"
        And I select "Media/journalistikk/informasjon/PR" from "company_industrytags"
        And I fill in text editor "Kortskildring av bedrifta og hovedaktivieten:" with "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum."
        And I press "Registrer bedrifta di"
        # Check
        Then I wait for "10" seconds
        And I should be at URL "/u/login"
        And I should see "Brukernavn"
        And I should see "Passord"
        And I should see "Hugs meg"
        And I should see "Gløymt passord?"
        And I should see "Logg inn"