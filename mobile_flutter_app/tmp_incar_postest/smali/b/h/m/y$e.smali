.class public Lb/h/m/y$e;
.super Lb/h/m/y$g;
.source "ViewCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/m/y;->a()Lb/h/m/y$g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lb/h/m/y$g<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(ILjava/lang/Class;I)V
    .registers 4

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lb/h/m/y$g;-><init>(ILjava/lang/Class;I)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)Ljava/lang/Boolean;
    .registers 2

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->isAccessibilityHeading()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic a(Landroid/view/View;)Ljava/lang/Object;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/h/m/y$e;->a(Landroid/view/View;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/view/View;Ljava/lang/Boolean;)V
    .registers 3

    .line 5
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setAccessibilityHeading(Z)V

    return-void
.end method

.method public bridge synthetic a(Landroid/view/View;Ljava/lang/Object;)V
    .registers 3

    .line 2
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2}, Lb/h/m/y$e;->a(Landroid/view/View;Ljava/lang/Boolean;)V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3

    .line 3
    check-cast p1, Ljava/lang/Boolean;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2}, Lb/h/m/y$e;->b(Ljava/lang/Boolean;Ljava/lang/Boolean;)Z

    move-result p1

    return p1
.end method

.method public b(Ljava/lang/Boolean;Ljava/lang/Boolean;)Z
    .registers 3

    .line 1
    invoke-virtual {p0, p1, p2}, Lb/h/m/y$g;->a(Ljava/lang/Boolean;Ljava/lang/Boolean;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method
