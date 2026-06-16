.class public Lc/a/a/a/p0/d$d;
.super Lcom/google/android/material/textfield/TextInputLayout$e;
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
.field public final synthetic e:Lc/a/a/a/p0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/d;Lcom/google/android/material/textfield/TextInputLayout;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/d$d;->e:Lc/a/a/a/p0/d;

    invoke-direct {p0, p2}, Lcom/google/android/material/textfield/TextInputLayout$e;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lb/h/m/h0/c;)V
    .registers 3

    .line 1
    invoke-super {p0, p1, p2}, Lcom/google/android/material/textfield/TextInputLayout$e;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/p0/d$d;->e:Lc/a/a/a/p0/d;

    iget-object p1, p1, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object p1

    invoke-static {p1}, Lc/a/a/a/p0/d;->b(Landroid/widget/EditText;)Z

    move-result p1

    if-nez p1, :cond_1a

    .line 3
    const-class p1, Landroid/widget/Spinner;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->a(Ljava/lang/CharSequence;)V

    .line 4
    :cond_1a
    invoke-virtual {p2}, Lb/h/m/h0/c;->w()Z

    move-result p1

    if-eqz p1, :cond_24

    const/4 p1, 0x0

    .line 5
    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->d(Ljava/lang/CharSequence;)V

    :cond_24
    return-void
.end method

.method public c(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2}, Lb/h/m/a;->c(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/p0/d$d;->e:Lc/a/a/a/p0/d;

    iget-object p1, p1, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object p1

    invoke-static {p1}, Lc/a/a/a/p0/d;->a(Landroid/widget/EditText;)Landroid/widget/AutoCompleteTextView;

    move-result-object p1

    .line 4
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result p2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_35

    iget-object p2, p0, Lc/a/a/a/p0/d$d;->e:Lc/a/a/a/p0/d;

    .line 5
    invoke-static {p2}, Lc/a/a/a/p0/d;->a(Lc/a/a/a/p0/d;)Landroid/view/accessibility/AccessibilityManager;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    move-result p2

    if-eqz p2, :cond_35

    iget-object p2, p0, Lc/a/a/a/p0/d$d;->e:Lc/a/a/a/p0/d;

    iget-object p2, p2, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    .line 6
    invoke-virtual {p2}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object p2

    invoke-static {p2}, Lc/a/a/a/p0/d;->b(Landroid/widget/EditText;)Z

    move-result p2

    if-nez p2, :cond_35

    .line 7
    iget-object p2, p0, Lc/a/a/a/p0/d$d;->e:Lc/a/a/a/p0/d;

    invoke-static {p2, p1}, Lc/a/a/a/p0/d;->a(Lc/a/a/a/p0/d;Landroid/widget/AutoCompleteTextView;)V

    :cond_35
    return-void
.end method
