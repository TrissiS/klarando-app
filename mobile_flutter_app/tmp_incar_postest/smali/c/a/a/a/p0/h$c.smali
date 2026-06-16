.class public Lc/a/a/a/p0/h$c;
.super Ljava/lang/Object;
.source "PasswordToggleEndIconDelegate.java"

# interfaces
.implements Lcom/google/android/material/textfield/TextInputLayout$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/p0/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/p0/h;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/h;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/h$c;->a:Lc/a/a/a/p0/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/material/textfield/TextInputLayout;I)V
    .registers 4

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object p1

    if-eqz p1, :cond_18

    const/4 v0, 0x1

    if-ne p2, v0, :cond_18

    .line 2
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 3
    new-instance p2, Lc/a/a/a/p0/h$c$a;

    invoke-direct {p2, p0, p1}, Lc/a/a/a/p0/h$c$a;-><init>(Lc/a/a/a/p0/h$c;Landroid/widget/EditText;)V

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    :cond_18
    return-void
.end method
