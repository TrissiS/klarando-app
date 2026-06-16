.class public Lc/a/a/a/p0/h;
.super Lc/a/a/a/p0/e;
.source "PasswordToggleEndIconDelegate.java"


# instance fields
.field public final d:Landroid/text/TextWatcher;

.field public final e:Lcom/google/android/material/textfield/TextInputLayout$f;

.field public final f:Lcom/google/android/material/textfield/TextInputLayout$g;


# direct methods
.method public constructor <init>(Lcom/google/android/material/textfield/TextInputLayout;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Lc/a/a/a/p0/e;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    .line 2
    new-instance p1, Lc/a/a/a/p0/h$a;

    invoke-direct {p1, p0}, Lc/a/a/a/p0/h$a;-><init>(Lc/a/a/a/p0/h;)V

    iput-object p1, p0, Lc/a/a/a/p0/h;->d:Landroid/text/TextWatcher;

    .line 3
    new-instance p1, Lc/a/a/a/p0/h$b;

    invoke-direct {p1, p0}, Lc/a/a/a/p0/h$b;-><init>(Lc/a/a/a/p0/h;)V

    iput-object p1, p0, Lc/a/a/a/p0/h;->e:Lcom/google/android/material/textfield/TextInputLayout$f;

    .line 4
    new-instance p1, Lc/a/a/a/p0/h$c;

    invoke-direct {p1, p0}, Lc/a/a/a/p0/h$c;-><init>(Lc/a/a/a/p0/h;)V

    iput-object p1, p0, Lc/a/a/a/p0/h;->f:Lcom/google/android/material/textfield/TextInputLayout$g;

    return-void
.end method

.method public static a(Landroid/widget/EditText;)Z
    .registers 3

    if-eqz p0, :cond_24

    .line 14
    invoke-virtual {p0}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    const/16 v1, 0x10

    if-eq v0, v1, :cond_22

    .line 15
    invoke-virtual {p0}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    const/16 v1, 0x80

    if-eq v0, v1, :cond_22

    .line 16
    invoke-virtual {p0}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    const/16 v1, 0x90

    if-eq v0, v1, :cond_22

    .line 17
    invoke-virtual {p0}, Landroid/widget/EditText;->getInputType()I

    move-result p0

    const/16 v0, 0xe0

    if-ne p0, v0, :cond_24

    :cond_22
    const/4 p0, 0x1

    goto :goto_25

    :cond_24
    const/4 p0, 0x0

    :goto_25
    return p0
.end method

.method public static synthetic a(Lc/a/a/a/p0/h;)Z
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/p0/h;->c()Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lc/a/a/a/p0/h;)Landroid/text/TextWatcher;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/p0/h;->d:Landroid/text/TextWatcher;

    return-object p0
.end method


# virtual methods
.method public a()V
    .registers 4

    .line 2
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lc/a/a/a/p0/e;->b:Landroid/content/Context;

    sget v2, Lc/a/a/a/e;->design_password_eye:I

    .line 3
    invoke-static {v1, v2}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 5
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    .line 6
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lc/a/a/a/j;->password_toggle_content_description:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconContentDescription(Ljava/lang/CharSequence;)V

    .line 8
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v1, Lc/a/a/a/p0/h$d;

    invoke-direct {v1, p0}, Lc/a/a/a/p0/h$d;-><init>(Lc/a/a/a/p0/h;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lc/a/a/a/p0/h;->e:Lcom/google/android/material/textfield/TextInputLayout$f;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/textfield/TextInputLayout$f;)V

    .line 10
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lc/a/a/a/p0/h;->f:Lcom/google/android/material/textfield/TextInputLayout$g;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/textfield/TextInputLayout$g;)V

    .line 11
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    .line 12
    invoke-static {v0}, Lc/a/a/a/p0/h;->a(Landroid/widget/EditText;)Z

    move-result v1

    if-eqz v1, :cond_47

    .line 13
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    :cond_47
    return-void
.end method

.method public final c()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 2
    invoke-virtual {v0}, Landroid/widget/EditText;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v0

    instance-of v0, v0, Landroid/text/method/PasswordTransformationMethod;

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    return v0
.end method
