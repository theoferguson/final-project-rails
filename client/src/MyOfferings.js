import { Modal, Button, Form, Dropdown, Segment } from "semantic-ui-react";
import { useEffect, useState } from 'react';
import OfferingCard from './OfferingCard';

function MyOfferings({ user, marketplace, setUser, issueRequest, setIssueRequest, allUsCities }) {
    const [show, setShow] = useState(false);
    const [offering, setOffering] = useState({});
    const [allOfferings, setAllOfferings] = useState(user.offerings);

    useEffect(() => {
        fetch("/me/offerings").then((response) => {
            if (response.ok) {
                response.json().then((offerings) => setAllOfferings(offerings));
            }
        });
    }, [issueRequest]);

    function cityOptions() {
        return allUsCities.map((city) => {
            return {
                text: `${city.city}`,
                value: `${city.city}`,
                key: `${city.city}`
            }
        })
    };

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    function handleSubmit(e) {
        e.preventDefault();
        fetch(`/offerings`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(
                offering
            ),
        })
            .then((r) => r.json())
            .then((json) => {
                // console.log(json)
                setOffering({})
                handleClose()
                setIssueRequest(!issueRequest)
            })
    };

    function handleChange(event) {
        if (event.target.id === "less_than_truckload" || event.target.id === "full_truckload") {
            setOffering({ ...offering, [event.target.name]: event.target.checked })
        } else if (event._reactName === "onClick") {
            setOffering({ ...offering, [event.target.parentElement.parentElement.id]: event.target.innerText })
        } else {
            setOffering({ ...offering, [event.target.name]: event.target.value })
        }
    };

    // useEffect(() => {
    //     console.log(offering);
    // }, [offering]);

    return (
        <>
            <Button basic fluid color='teal' onClick={handleShow}>
                Add New Offering
            </Button>

            <Modal
                dimmer={show ? "blurring" : undefined}
                open={show}
                onClose={() => setShow(false)}
                centered
            >
                <Modal.Header>
                    New offering:
                </Modal.Header>
                <Modal.Content>
                    <Form onSubmit={handleSubmit}>
                        <Form.Field>
                            <label>
                                Offering name:
                                <Form.Input type="text" name="name" value={offering.name ? offering.name : ''} onChange={handleChange} />
                            </label>
                        </Form.Field>
                        <Form.Field>
                            <label>
                                Asking Price (total $):
                                <Form.Input type="text" name="asking_price" value={offering.asking_price ? offering.asking_price : ''} onChange={handleChange} />
                            </label>
                        </Form.Field>
                        <Form.Field>
                            <label htmlFor='less_than_truckload' >Less than truckload (LTL)?</label>
                            <input type='checkbox' id="less_than_truckload" name='less_than_truckload' value={offering.less_than_truckload ? offering.less_than_truckload : ''} onChange={handleChange} />
                        </Form.Field>
                        <Form.Field>
                            <label htmlFor='full_truckload' >Full truckload (FTL)?</label>
                            <input type='checkbox' id="full_truckload" name='full_truckload' value={offering.full_truckload ? offering.full_truckload : ''} onChange={handleChange} />
                        </Form.Field>
                        <Form.Field>
                            <label>
                                Origin City:
                            </label>
                            <Dropdown
                                options={cityOptions()}
                                placeholder={offering.origin ? offering.origin : 'origin'}
                                search
                                selection
                                onChange={handleChange}
                                id="origin"
                                value={offering.origin ? offering.origin : ''}
                            />
                        </Form.Field>
                        <Form.Field>
                            <label>
                                Origin date:
                                <Form.Input type="date" name="origin_date" value={offering.origin_date ? offering.origin_date : ''} onChange={handleChange} />
                            </label>
                        </Form.Field>
                        <Form.Field>
                            <label>
                                Destination City:
                            </label>
                            <Dropdown
                                options={cityOptions()}
                                placeholder={offering.destination ? offering.destination : 'destination'}
                                search
                                selection
                                onChange={handleChange}
                                id="destination"
                                value={offering.destination ? offering.destination : ''}
                            />
                        </Form.Field>
                        <Form.Field>
                            <label>
                                Destination date:
                                <Form.Input type="date" name="destination_date" value={offering.destination_date ? offering.destination_date : ''} onChange={handleChange} />
                            </label>
                        </Form.Field>
                        <Modal.Actions>
                            <Button type="submit" value="Create new offering" color='teal'>Submit Offering</Button>
                        </Modal.Actions>
                    </Form>
                </Modal.Content>
            </Modal>
            <Segment>
                <h3>Your Offerings</h3>
                {allOfferings.map((offering) => {
                    return (
                        <OfferingCard
                            key={offering.id}
                            offering={offering}
                            marketplace={marketplace}
                            user={user}
                            setUser={setUser}
                            issueRequest={issueRequest}
                            setIssueRequest={setIssueRequest}
                        />
                    )
                })}
            </Segment>
        </>
    )
};

export default MyOfferings;