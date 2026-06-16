.class public Lc/a/a/a/p0/a$c;
.super Ljava/lang/Object;
.source "ClearTextEndIconDelegate.java"

# interfaces
.implements Lcom/google/android/material/textfield/TextInputLayout$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/p0/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/p0/a;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/a$c;->a:Lc/a/a/a/p0/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/material/textfield/TextInputLayout;)V
    .registers 5

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Landroid/widget/EditText;->hasFocus()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_17

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-static {v1}, Lc/a/a/a/p0/a;->a(Landroid/text/Editable;)Z

    move-result v1

    if-eqz v1, :cond_17

    const/4 v1, 0x1

    goto :goto_18

    :cond_17
    const/4 v1, 0x0

    :goto_18
    invoke-virtual {p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconVisible(Z)V

    .line 3
    invoke-virtual {p1, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconCheckable(Z)V

    .line 4
    iget-object p1, p0, Lc/a/a/a/p0/a$c;->a:Lc/a/a/a/p0/a;

    invoke-static {p1}, Lc/a/a/a/p0/a;->a(Lc/a/a/a/p0/a;)Landroid/view/View$OnFocusChangeListener;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 5
    iget-object p1, p0, Lc/a/a/a/p0/a$c;->a:Lc/a/a/a/p0/a;

    invoke-static {p1}, Lc/a/a/a/p0/a;->b(Lc/a/a/a/p0/a;)Landroid/text/TextWatcher;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 6
    iget-object p1, p0, Lc/a/a/a/p0/a$c;->a:Lc/a/a/a/p0/a;

    invoke-static {p1}, Lc/a/a/a/p0/a;->b(Lc/a/a/a/p0/a;)Landroid/text/TextWatcher;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method
