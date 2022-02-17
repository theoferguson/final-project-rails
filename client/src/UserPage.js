import { useEffect, useState } from 'react';
import MyOfferings from './MyOfferings';
import Settings from './Settings';
import MyData from './MyData';
import { Grid, Segment } from 'semantic-ui-react'

function UserPage({ user, setUser, marketplace, setIssueRequest, issueRequest }) {
    const [allUsCities, setAllUsCities] = useState([])

    useEffect(() => {
        fetch("https://countriesnow.space/api/v0.1/countries/population/cities/filter", {
            method: 'POST',
            redirect: 'follow'
        })
            .then((response) => {
                if (response.ok) {
                    response.json().then((data) => {
                        setAllUsCities(data.data.filter((city) => {
                            return city.country === "United States of America"
                        }));
                    });
                }
            });
    }, [issueRequest]);

    return (
        <Grid divided>
            <Grid.Column width={8}>
                <Segment>
                    <Settings 
                    user={user} 
                    setUser={setUser} 
                    issueRequest={issueRequest} 
                    setIssueRequest={setIssueRequest} 
                    />
                </Segment>
                <Segment>
                    <MyData />
                </Segment>
            </Grid.Column>
            <Grid.Column width={8}>
                <MyOfferings 
                user={user} 
                marketplace={marketplace} 
                setUser={setUser} 
                issueRequest={issueRequest} 
                setIssueRequest={setIssueRequest} 
                allUsCities={allUsCities}
                />
            </Grid.Column>
        </Grid>
    )
};

export default UserPage;