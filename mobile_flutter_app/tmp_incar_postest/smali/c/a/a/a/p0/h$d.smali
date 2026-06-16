.class public Lc/a/a/a/p0/h$d;
.super Ljava/lang/Object;
.source "PasswordToggleEndIconDelegate.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/p0/h;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/p0/h;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/h;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/h$d;->h:Lc/a/a/a/p0/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 1
    iget-object p1, p0, Lc/a/a/a/p0/h$d;->h:Lc/a/a/a/p0/h;

    iget-object p1, p1, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object p1

    if-nez p1, :cond_b

    return-void

    .line 2
    :cond_b
    invoke-virtual {p1}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v0

    .line 3
    iget-object v1, p0, Lc/a/a/a/p0/h$d;->h:Lc/a/a/a/p0/h;

    invoke-static {v1}, Lc/a/a/a/p0/h;->a(Lc/a/a/a/p0/h;)Z

    move-result v1

    if-eqz v1, :cond_1c

    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    goto :goto_23

    .line 5
    :cond_1c
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    :goto_23
    if-ltz v0, :cond_28

    .line 6
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 7
    :cond_28
    iget-object p1, p0, Lc/a/a/a/p0/h$d;->h:Lc/a/a/a/p0/h;

    iget-object p1, p1, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->z()V

    return-void
.end method
