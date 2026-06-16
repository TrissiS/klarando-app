.class public Lb/h/m/a;
.super Ljava/lang/Object;
.source "AccessibilityDelegateCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/m/a$a;
    }
.end annotation


# static fields
.field public static final c:Landroid/view/View$AccessibilityDelegate;


# instance fields
.field public final a:Landroid/view/View$AccessibilityDelegate;

.field public final b:Landroid/view/View$AccessibilityDelegate;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Landroid/view/View$AccessibilityDelegate;

    invoke-direct {v0}, Landroid/view/View$AccessibilityDelegate;-><init>()V

    sput-object v0, Lb/h/m/a;->c:Landroid/view/View$AccessibilityDelegate;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    sget-object v0, Lb/h/m/a;->c:Landroid/view/View$AccessibilityDelegate;

    invoke-direct {p0, v0}, Lb/h/m/a;-><init>(Landroid/view/View$AccessibilityDelegate;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View$AccessibilityDelegate;)V
    .registers 2

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lb/h/m/a;->a:Landroid/view/View$AccessibilityDelegate;

    .line 4
    new-instance p1, Lb/h/m/a$a;

    invoke-direct {p1, p0}, Lb/h/m/a$a;-><init>(Lb/h/m/a;)V

    iput-object p1, p0, Lb/h/m/a;->b:Landroid/view/View$AccessibilityDelegate;

    return-void
.end method

.method public static b(Landroid/view/View;)Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Ljava/util/List<",
            "Lb/h/m/h0/c$a;",
            ">;"
        }
    .end annotation

    .line 2
    sget v0, Lb/h/b;->tag_accessibility_actions:I

    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-nez p0, :cond_e

    .line 4
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    :cond_e
    return-object p0
.end method


# virtual methods
.method public a()Landroid/view/View$AccessibilityDelegate;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/a;->b:Landroid/view/View$AccessibilityDelegate;

    return-object v0
.end method

.method public a(Landroid/view/View;)Lb/h/m/h0/d;
    .registers 4

    .line 8
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_14

    .line 9
    iget-object v0, p0, Lb/h/m/a;->a:Landroid/view/View$AccessibilityDelegate;

    invoke-virtual {v0, p1}, Landroid/view/View$AccessibilityDelegate;->getAccessibilityNodeProvider(Landroid/view/View;)Landroid/view/accessibility/AccessibilityNodeProvider;

    move-result-object p1

    if-eqz p1, :cond_14

    .line 10
    new-instance v0, Lb/h/m/h0/d;

    invoke-direct {v0, p1}, Lb/h/m/h0/d;-><init>(Ljava/lang/Object;)V

    return-object v0

    :cond_14
    const/4 p1, 0x0

    return-object p1
.end method

.method public a(Landroid/view/View;I)V
    .registers 4

    .line 2
    iget-object v0, p0, Lb/h/m/a;->a:Landroid/view/View$AccessibilityDelegate;

    invoke-virtual {v0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->sendAccessibilityEvent(Landroid/view/View;I)V

    return-void
.end method

.method public a(Landroid/view/View;Lb/h/m/h0/c;)V
    .registers 4

    .line 4
    iget-object v0, p0, Lb/h/m/a;->a:Landroid/view/View$AccessibilityDelegate;

    .line 5
    invoke-virtual {p2}, Lb/h/m/h0/c;->z()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p2

    .line 6
    invoke-virtual {v0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    return-void
.end method

.method public final a(ILandroid/view/View;)Z
    .registers 4

    .line 21
    sget v0, Lb/h/b;->tag_accessibility_clickable_spans:I

    .line 22
    invoke-virtual {p2, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseArray;

    if-eqz v0, :cond_23

    .line 23
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_23

    .line 24
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/text/style/ClickableSpan;

    .line 25
    invoke-virtual {p0, p1, p2}, Lb/h/m/a;->a(Landroid/text/style/ClickableSpan;Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 26
    invoke-virtual {p1, p2}, Landroid/text/style/ClickableSpan;->onClick(Landroid/view/View;)V

    const/4 p1, 0x1

    return p1

    :cond_23
    const/4 p1, 0x0

    return p1
.end method

.method public final a(Landroid/text/style/ClickableSpan;Landroid/view/View;)Z
    .registers 6

    const/4 v0, 0x0

    if-eqz p1, :cond_22

    .line 27
    invoke-virtual {p2}, Landroid/view/View;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p2

    .line 28
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p2}, Lb/h/m/h0/c;->j(Ljava/lang/CharSequence;)[Landroid/text/style/ClickableSpan;

    move-result-object p2

    const/4 v1, 0x0

    :goto_10
    if-eqz p2, :cond_22

    .line 29
    array-length v2, p2

    if-ge v1, v2, :cond_22

    .line 30
    aget-object v2, p2, v1

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    const/4 p1, 0x1

    return p1

    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    :cond_22
    return v0
.end method

.method public a(Landroid/view/View;ILandroid/os/Bundle;)Z
    .registers 9

    .line 11
    invoke-static {p1}, Lb/h/m/a;->b(Landroid/view/View;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 12
    :goto_6
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_20

    .line 13
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/h/m/h0/c$a;

    .line 14
    invoke-virtual {v3}, Lb/h/m/h0/c$a;->a()I

    move-result v4

    if-ne v4, p2, :cond_1d

    .line 15
    invoke-virtual {v3, p1, p3}, Lb/h/m/h0/c$a;->a(Landroid/view/View;Landroid/os/Bundle;)Z

    move-result v1

    goto :goto_20

    :cond_1d
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_20
    :goto_20
    if-nez v1, :cond_2e

    .line 16
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v0, v2, :cond_2e

    .line 17
    iget-object v0, p0, Lb/h/m/a;->a:Landroid/view/View$AccessibilityDelegate;

    invoke-virtual {v0, p1, p2, p3}, Landroid/view/View$AccessibilityDelegate;->performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z

    move-result v1

    :cond_2e
    if-nez v1, :cond_3f

    .line 18
    sget v0, Lb/h/b;->accessibility_action_clickable_span:I

    if-ne p2, v0, :cond_3f

    const/4 p2, -0x1

    const-string v0, "ACCESSIBILITY_CLICKABLE_SPAN_ID"

    .line 19
    invoke-virtual {p3, v0, p2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p2

    .line 20
    invoke-virtual {p0, p2, p1}, Lb/h/m/a;->a(ILandroid/view/View;)Z

    move-result v1

    :cond_3f
    return v1
.end method

.method public a(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 4

    .line 3
    iget-object v0, p0, Lb/h/m/a;->a:Landroid/view/View$AccessibilityDelegate;

    invoke-virtual {v0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->dispatchPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 5

    .line 7
    iget-object v0, p0, Lb/h/m/a;->a:Landroid/view/View$AccessibilityDelegate;

    invoke-virtual {v0, p1, p2, p3}, Landroid/view/View$AccessibilityDelegate;->onRequestSendAccessibilityEvent(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public b(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/h/m/a;->a:Landroid/view/View$AccessibilityDelegate;

    invoke-virtual {v0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->onInitializeAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    return-void
.end method

.method public c(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/h/m/a;->a:Landroid/view/View$AccessibilityDelegate;

    invoke-virtual {v0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->onPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    return-void
.end method

.method public d(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/h/m/a;->a:Landroid/view/View$AccessibilityDelegate;

    invoke-virtual {v0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->sendAccessibilityEventUnchecked(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    return-void
.end method
