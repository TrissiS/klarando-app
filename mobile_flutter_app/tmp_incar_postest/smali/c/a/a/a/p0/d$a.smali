.class public Lc/a/a/a/p0/d$a;
.super Lc/a/a/a/d0/l;
.source "DropdownMenuEndIconDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/p0/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/p0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/d$a;->h:Lc/a/a/a/p0/d;

    invoke-direct {p0}, Lc/a/a/a/d0/l;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lc/a/a/a/p0/d$a;->h:Lc/a/a/a/p0/d;

    iget-object p1, p1, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object p1

    invoke-static {p1}, Lc/a/a/a/p0/d;->a(Landroid/widget/EditText;)Landroid/widget/AutoCompleteTextView;

    move-result-object p1

    .line 3
    iget-object v0, p0, Lc/a/a/a/p0/d$a;->h:Lc/a/a/a/p0/d;

    invoke-static {v0}, Lc/a/a/a/p0/d;->a(Lc/a/a/a/p0/d;)Landroid/view/accessibility/AccessibilityManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 4
    invoke-static {p1}, Lc/a/a/a/p0/d;->b(Landroid/widget/EditText;)Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lc/a/a/a/p0/d$a;->h:Lc/a/a/a/p0/d;

    iget-object v0, v0, Lc/a/a/a/p0/e;->c:Lcom/google/android/material/internal/CheckableImageButton;

    .line 5
    invoke-virtual {v0}, Landroid/widget/ImageButton;->hasFocus()Z

    move-result v0

    if-nez v0, :cond_2b

    .line 6
    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    .line 7
    :cond_2b
    new-instance v0, Lc/a/a/a/p0/d$a$a;

    invoke-direct {v0, p0, p1}, Lc/a/a/a/p0/d$a$a;-><init>(Lc/a/a/a/p0/d$a;Landroid/widget/AutoCompleteTextView;)V

    invoke-virtual {p1, v0}, Landroid/widget/AutoCompleteTextView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
