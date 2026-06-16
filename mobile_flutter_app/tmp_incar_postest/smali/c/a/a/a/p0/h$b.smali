.class public Lc/a/a/a/p0/h$b;
.super Ljava/lang/Object;
.source "PasswordToggleEndIconDelegate.java"

# interfaces
.implements Lcom/google/android/material/textfield/TextInputLayout$f;


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
    iput-object p1, p0, Lc/a/a/a/p0/h$b;->a:Lc/a/a/a/p0/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/material/textfield/TextInputLayout;)V
    .registers 5

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    const/4 v1, 0x1

    .line 2
    invoke-virtual {p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconVisible(Z)V

    .line 3
    invoke-virtual {p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconCheckable(Z)V

    .line 4
    iget-object p1, p0, Lc/a/a/a/p0/h$b;->a:Lc/a/a/a/p0/h;

    iget-object v2, p1, Lc/a/a/a/p0/e;->c:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {p1}, Lc/a/a/a/p0/h;->a(Lc/a/a/a/p0/h;)Z

    move-result p1

    xor-int/2addr p1, v1

    invoke-virtual {v2, p1}, Lcom/google/android/material/internal/CheckableImageButton;->setChecked(Z)V

    .line 5
    iget-object p1, p0, Lc/a/a/a/p0/h$b;->a:Lc/a/a/a/p0/h;

    invoke-static {p1}, Lc/a/a/a/p0/h;->b(Lc/a/a/a/p0/h;)Landroid/text/TextWatcher;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 6
    iget-object p1, p0, Lc/a/a/a/p0/h$b;->a:Lc/a/a/a/p0/h;

    invoke-static {p1}, Lc/a/a/a/p0/h;->b(Lc/a/a/a/p0/h;)Landroid/text/TextWatcher;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method
