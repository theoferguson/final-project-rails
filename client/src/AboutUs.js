import { Message, Header, Image } from 'semantic-ui-react';

function AboutUs() {

    const list = [
        'Track your trucking schedule in your own User Page',
        'Post your offering from your User Page to the public Marketplace',
        'Receive messages from capacity seekers interested in your offering'
    ]

    return (
        <>
            <Header>Online Marketplace for Trucking Capacity Providers</Header>
            <Message header='What do we do:' list={list} />
            <Image src='https://www.ttnews.com/sites/default/files/images/articles/decadereview.jpg' size='large' centered verticalAlign='bottom' />
        </>
    )
};

export default AboutUs;