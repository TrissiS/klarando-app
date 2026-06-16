.class public Lb/h/m/h0/d$a;
.super Landroid/view/accessibility/AccessibilityNodeProvider;
.source "AccessibilityNodeProviderCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/h0/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Lb/h/m/h0/d;


# direct methods
.method public constructor <init>(Lb/h/m/h0/d;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroid/view/accessibility/AccessibilityNodeProvider;-><init>()V

    .line 2
    iput-object p1, p0, Lb/h/m/h0/d$a;->a:Lb/h/m/h0/d;

    return-void
.end method


# virtual methods
.method public createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/m/h0/d$a;->a:Lb/h/m/h0/d;

    .line 2
    invoke-virtual {v0, p1}, Lb/h/m/h0/d;->a(I)Lb/h/m/h0/c;

    move-result-object p1

    if-nez p1, :cond_a

    const/4 p1, 0x0

    return-object p1

    .line 3
    :cond_a
    invoke-virtual {p1}, Lb/h/m/h0/c;->z()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1

    return-object p1
.end method

.method public findAccessibilityNodeInfosByText(Ljava/lang/String;I)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/List<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/h/m/h0/d$a;->a:Lb/h/m/h0/d;

    .line 2
    invoke-virtual {v0, p1, p2}, Lb/h/m/h0/d;->a(Ljava/lang/String;I)Ljava/util/List;

    move-result-object p1

    if-nez p1, :cond_a

    const/4 p1, 0x0

    return-object p1

    .line 3
    :cond_a
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 4
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_14
    if-ge v1, v0, :cond_26

    .line 5
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/h/m/h0/c;

    .line 6
    invoke-virtual {v2}, Lb/h/m/h0/c;->z()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    :cond_26
    return-object p2
.end method

.method public performAction(IILandroid/os/Bundle;)Z
    .registers 5

    .line 1
    iget-object v0, p0, Lb/h/m/h0/d$a;->a:Lb/h/m/h0/d;

    invoke-virtual {v0, p1, p2, p3}, Lb/h/m/h0/d;->a(IILandroid/os/Bundle;)Z

    move-result p1

    return p1
.end method
