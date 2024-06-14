import 'package:flutter/material.dart';

class LegalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Legal Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSimpleExpansionTile(
                'Important Laws',
                [
                  _buildSimpleListTile('The Constitution of Kenya, 2010',
                      'This law says everyone should be treated equally and with respect. No one should hurt you.'),
                  _buildSimpleListTile('The Sexual Offences Act, 2006',
                      'This law protects people from bad touching and other sexual harms. It punishes those who do these bad things.'),
                  _buildSimpleListTile(
                      'The Protection Against Domestic Violence Act, 2015',
                      'This law helps people who are hurt at home. It protects them from physical, emotional, and money-related harm.'),
                  _buildSimpleListTile('The Penal Code',
                      'This law lists different kinds of harm and how they are punished.'),
                  _buildSimpleListTile('The Children Act, 2001',
                      'This law keeps children safe from harm and abuse.'),
                  _buildSimpleListTile('The Victim Protection Act, 2014',
                      'This law helps and supports people who have been hurt or abused.'),
                ],
              ),
              _buildSimpleExpansionTile(
                'What to Do If You Are Hurt',
                [
                  _buildSimpleListTile('Tell Someone',
                      'Go to the police or talk to a trusted adult.'),
                  _buildSimpleListTile('See a Doctor',
                      'Visit a doctor to check your injuries. The doctor will fill out a form to help with your case.'),
                  _buildSimpleListTile('Report the Case',
                      'The police will officially record what happened and start an investigation.'),
                  _buildSimpleListTile('Get a Protection Order',
                      'You can ask a judge to keep the person who hurt you away from you.'),
                  _buildSimpleListTile('Go to Court',
                      'If there is enough proof, the person who hurt you will be taken to court.'),
                  _buildSimpleListTile('Get Help and Support',
                      'You can get counseling, a safe place to stay, and other help.'),
                  _buildSimpleListTile('Court Decision',
                      'A judge will decide if the person is guilty and what the punishment will be.'),
                  _buildSimpleListTile('Appeal',
                      'If you or the person who hurt you do not agree with the judge, you can ask another judge to look at the case again.'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSimpleExpansionTile(String title, List<Widget> children) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: children,
    );
  }

  Widget _buildSimpleListTile(String title, String subtitle) {
    return ListTile(
      title: Text(title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 14)),
    );
  }
}
