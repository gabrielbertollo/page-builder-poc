<?php

class GridLayout {
    public function __construct(public array $children)
    {
        
    }
}

class CardComponent {
    public function __construct(public string $title, public string $icon, public Action $action)
    {
        
    }
}

class Action {
    public function __construct(public string $moduleType,  public string $moduleId, public string $url, string $skeleton)
    {
        
    }
}

class ModalButton extends Button {
    public function __construct(public Modal $modal)
    {
        
    }
}

new GridLayout(
    modals: [
        'add-user' => new Modal(
            form: new Form(
                action: 'https://',
                method: 'POST',
                name: 'add-user',
                fields: [
                    new TextInput(),
                ]
            ),
            actions: [
                new Button(
                    label: 'Submit',
                    action: 'submit'
                )
            ],
        )
    ],
    children: [
        new CardComponent(
            title: 'Card 1',
            icon: 'icon1',
            action: new Action(
                moduleType: 'blog',
                moduleId: '1',
                skeleton: new CardSkeletonComponent(
                    title: true,
                    subtitle: true,
                    icon: true,
                    bottomRightIcon: true,
                )
            )
        ),
        new CardComponent(
            title: 'Card 2',
            icon: 'icon2'
        ),
        new CardComponent(
            title: 'Card 3',
            icon: 'icon3'
        ),
        new Button(modal: 'add-users')
    ]
);

class TextField extends Field {
    protected Controller $controller;

    public function __construct(public string $name)
    {
        $this->controller = new Controller();
    }

    public function getValue(): string
    {

        // upload

        return $this->controller->getText();
    }
}

class Form {
    protected array $fields;

    public function __construct(array $fields)
    {
        $this->fields = $fields;
    }

    public function submit(): void
    {
        foreach ($this->fields as $field) {
            $field->getValue();
        }
    }
}


new Form(
    fields: [
        new TextField(name: '1d4f5547-e6fd-48b6-aa20-f2a22a249da6'),
    ]
);