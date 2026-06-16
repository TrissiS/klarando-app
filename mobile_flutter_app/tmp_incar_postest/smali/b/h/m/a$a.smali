.class public final Lb/h/m/a$a;
.super Landroid/view/View$AccessibilityDelegate;
.source "AccessibilityDelegateCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Lb/h/m/a;


# direct methods
.method public constructor <init>(Lb/h/m/a;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroid/view/View$AccessibilityDelegate;-><init>()V

    .line 2
    iput-object p1, p0, Lb/h/m/a$a;->a:Lb/h/m/a;

    return-void
.end method


# virtual methods
.method public dispatchPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 4

    .line 1
    iget-object v0, p0, Lb/h/m/a$a;->a:Lb/h/m/a;

    invoke-virtual {v0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public getAccessibilityNodeProvider(Landroid/view/View;)Landroid/view/accessibility/AccessibilityNodeProvider;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/m/a$a;->a:Lb/h/m/a;

    .line 2
    invoke-virtual {v0, p1}, Lb/h/m/a;->a(Landroid/view/View;)Lb/h/m/h0/d;

    move-result-object p1

    if-eqz p1, :cond_f

    .line 3
    invoke-virtual {p1}, Lb/h/m/h0/d;->a()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/accessibility/AccessibilityNodeProvider;

    goto :goto_10

    :cond_f
    const/4 p1, 0x0

    :goto_10
    return-object p1
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/h/m/a$a;->a:Lb/h/m/a;

    invoke-virtual {v0, p1, p2}, Lb/h/m/a;->b(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 5

    .line 1
    invoke-static {p2}, Lb/h/m/h0/c;->a(Landroid/view/accessibility/AccessibilityNodeInfo;)Lb/h/m/h0/c;

    move-result-object v0

    .line 2
    invoke-static {p1}, Lb/h/m/y;->N(Landroid/view/View;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lb/h/m/h0/c;->k(Z)V

    .line 3
    invoke-static {p1}, Lb/h/m/y;->I(Landroid/view/View;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lb/h/m/h0/c;->i(Z)V

    .line 4
    invoke-static {p1}, Lb/h/m/y;->f(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb/h/m/h0/c;->f(Ljava/lang/CharSequence;)V

    .line 5
    invoke-static {p1}, Lb/h/m/y;->A(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb/h/m/h0/c;->h(Ljava/lang/CharSequence;)V

    .line 6
    iget-object v1, p0, Lb/h/m/a$a;->a:Lb/h/m/a;

    invoke-virtual {v1, p1, v0}, Lb/h/m/a;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    .line 7
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {v0, p2, p1}, Lb/h/m/h0/c;->a(Ljava/lang/CharSequence;Landroid/view/View;)V

    .line 8
    invoke-static {p1}, Lb/h/m/a;->b(Landroid/view/View;)Ljava/util/List;

    move-result-object p1

    const/4 p2, 0x0

    .line 9
    :goto_31
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge p2, v1, :cond_43

    .line 10
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/h/m/h0/c$a;

    invoke-virtual {v0, v1}, Lb/h/m/h0/c;->a(Lb/h/m/h0/c$a;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_31

    :cond_43
    return-void
.end method

.method public onPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/h/m/a$a;->a:Lb/h/m/a;

    invoke-virtual {v0, p1, p2}, Lb/h/m/a;->c(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    return-void
.end method

.method public onRequestSendAccessibilityEvent(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 5

    .line 1
    iget-object v0, p0, Lb/h/m/a$a;->a:Lb/h/m/a;

    invoke-virtual {v0, p1, p2, p3}, Lb/h/m/a;->a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z
    .registers 5

    .line 1
    iget-object v0, p0, Lb/h/m/a$a;->a:Lb/h/m/a;

    invoke-virtual {v0, p1, p2, p3}, Lb/h/m/a;->a(Landroid/view/View;ILandroid/os/Bundle;)Z

    move-result p1

    return p1
.end method

.method public sendAccessibilityEvent(Landroid/view/View;I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/h/m/a$a;->a:Lb/h/m/a;

    invoke-virtual {v0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;I)V

    return-void
.end method

.method public sendAccessibilityEventUnchecked(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/h/m/a$a;->a:Lb/h/m/a;

    invoke-virtual {v0, p1, p2}, Lb/h/m/a;->d(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    return-void
.end method
