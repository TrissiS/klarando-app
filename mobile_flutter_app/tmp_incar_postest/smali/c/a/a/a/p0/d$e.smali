.class public Lc/a/a/a/p0/d$e;
.super Ljava/lang/Object;
.source "DropdownMenuEndIconDelegate.java"

# interfaces
.implements Lcom/google/android/material/textfield/TextInputLayout$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/p0/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/p0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/d$e;->a:Lc/a/a/a/p0/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/material/textfield/TextInputLayout;)V
    .registers 5

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    invoke-static {v0}, Lc/a/a/a/p0/d;->a(Landroid/widget/EditText;)Landroid/widget/AutoCompleteTextView;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lc/a/a/a/p0/d$e;->a:Lc/a/a/a/p0/d;

    invoke-static {v1, v0}, Lc/a/a/a/p0/d;->b(Lc/a/a/a/p0/d;Landroid/widget/AutoCompleteTextView;)V

    .line 3
    iget-object v1, p0, Lc/a/a/a/p0/d$e;->a:Lc/a/a/a/p0/d;

    invoke-static {v1, v0}, Lc/a/a/a/p0/d;->c(Lc/a/a/a/p0/d;Landroid/widget/AutoCompleteTextView;)V

    .line 4
    iget-object v1, p0, Lc/a/a/a/p0/d$e;->a:Lc/a/a/a/p0/d;

    invoke-static {v1, v0}, Lc/a/a/a/p0/d;->d(Lc/a/a/a/p0/d;Landroid/widget/AutoCompleteTextView;)V

    const/4 v1, 0x0

    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setThreshold(I)V

    .line 6
    iget-object v1, p0, Lc/a/a/a/p0/d$e;->a:Lc/a/a/a/p0/d;

    invoke-static {v1}, Lc/a/a/a/p0/d;->g(Lc/a/a/a/p0/d;)Landroid/text/TextWatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 7
    iget-object v1, p0, Lc/a/a/a/p0/d$e;->a:Lc/a/a/a/p0/d;

    invoke-static {v1}, Lc/a/a/a/p0/d;->g(Lc/a/a/a/p0/d;)Landroid/text/TextWatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconCheckable(Z)V

    const/4 v2, 0x0

    .line 9
    invoke-virtual {p1, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 10
    invoke-static {v0}, Lc/a/a/a/p0/d;->b(Landroid/widget/EditText;)Z

    move-result v0

    if-nez v0, :cond_43

    .line 11
    iget-object v0, p0, Lc/a/a/a/p0/d$e;->a:Lc/a/a/a/p0/d;

    iget-object v0, v0, Lc/a/a/a/p0/e;->c:Lcom/google/android/material/internal/CheckableImageButton;

    const/4 v2, 0x2

    invoke-static {v0, v2}, Lb/h/m/y;->h(Landroid/view/View;I)V

    .line 12
    :cond_43
    iget-object v0, p0, Lc/a/a/a/p0/d$e;->a:Lc/a/a/a/p0/d;

    invoke-static {v0}, Lc/a/a/a/p0/d;->b(Lc/a/a/a/p0/d;)Lcom/google/android/material/textfield/TextInputLayout$e;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setTextInputAccessibilityDelegate(Lcom/google/android/material/textfield/TextInputLayout$e;)V

    .line 13
    invoke-virtual {p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconVisible(Z)V

    return-void
.end method
