.class public Lc/a/a/a/p0/a$a;
.super Ljava/lang/Object;
.source "ClearTextEndIconDelegate.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/p0/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/p0/a;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/a$a;->h:Lc/a/a/a/p0/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/p0/a$a;->h:Lc/a/a/a/p0/a;

    iget-object v0, v0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->getSuffixText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_b

    return-void

    .line 2
    :cond_b
    iget-object v0, p0, Lc/a/a/a/p0/a$a;->h:Lc/a/a/a/p0/a;

    iget-object v1, v0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->hasFocus()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-static {p1}, Lc/a/a/a/p0/a;->a(Landroid/text/Editable;)Z

    move-result p1

    if-eqz p1, :cond_1d

    const/4 p1, 0x1

    goto :goto_1e

    :cond_1d
    const/4 p1, 0x0

    :goto_1e
    invoke-static {v0, p1}, Lc/a/a/a/p0/a;->a(Lc/a/a/a/p0/a;Z)V

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method
