/**
 * My BDD Test
 */
component extends="coldbox.system.testing.BaseTestCase" accessors="true" {

    /*********************************** LIFE CYCLE Methods ***********************************/

    // executes before all suites+specs in the run() method
    function beforeAll() {
        super.beforeAll();
    }

    // executes after all suites+specs in the run() method
    function afterAll() {
        super.afterAll();
    }

    /*********************************** BDD SUITES ***********************************/


    function run() {
        describe(
            title = 'run should',
            labels = 'automated',
            body = function() {
                beforeEach(function() {
                    errItem = getInstance('CreateErrors@ErrorFilter');
                    myerror = errItem.expressionError();

                    base = createmock(object = getinstance('errorFilter@errorFilter'));
                    base.$(method = 'addkeys', returns = {});
                    base.$(method = 'trimAndFilterTagContext', returns = []);

                    testobj = createmock(object = getInstance('expression@ErrorFilter'));
                    testObj.setBase(base);
                });
                it('Should run addKeys 1x', function() {
                    testme = testobj.run(myError);
                    expect(base.$count('addKeys')).tobe(1);
                });
                it('If tagContext is not the fields to be returned, should run trimAndFilterTagContext 0x', function() {
                    base.$(method = 'addkeys', returns = {});
                    testme = testobj.run(myError);
                    expect(base.$count('trimAndFilterTagContext')).tobe(0);
                });
                it('If tagContext is in the fields to be returned, should run trimAndFilterTagContext 1x', function() {
                    base.$(method = 'addkeys', returns = {'tagContext': []});
                    testme = testobj.run(myError);
                    expect(base.$count('trimAndFilterTagContext')).tobe(1);
                });
                it('The result should have the key filterClass which is ''ErrorFilter.models.expression''', function() {
                    base.$(method = 'addkeys', returns = {'tagContext': []});
                    testme = testobj.run(myError);
                    expect(testme.filterClass).tobe('ErrorFilter.models.expression');
                });
            }
        );
    }

}
