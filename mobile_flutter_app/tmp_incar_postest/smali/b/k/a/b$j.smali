.class public final Lb/k/a/b$j;
.super Lb/k/a/b$r;
.source "DynamicAnimation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/k/a/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lb/k/a/b$r;-><init>(Ljava/lang/String;Lb/k/a/b$f;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)F
    .registers 2

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getScaleY()F

    move-result p1

    return p1
.end method

.method public bridge synthetic a(Ljava/lang/Object;)F
    .registers 2

    .line 1
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lb/k/a/b$j;->a(Landroid/view/View;)F

    move-result p1

    return p1
.end method

.method public a(Landroid/view/View;F)V
    .registers 3

    .line 3
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleY(F)V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;F)V
    .registers 3

    .line 2
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Lb/k/a/b$j;->a(Landroid/view/View;F)V

    return-void
.end method
