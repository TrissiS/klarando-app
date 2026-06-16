.class public Lc/a/a/a/d0/q;
.super Ljava/lang/Object;
.source "ViewOverlayApi14.java"

# interfaces
.implements Lc/a/a/a/d0/s;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/d0/q$a;
    }
.end annotation


# instance fields
.field public a:Lc/a/a/a/d0/q$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/View;)V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lc/a/a/a/d0/q$a;

    invoke-direct {v0, p1, p2, p3, p0}, Lc/a/a/a/d0/q$a;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/View;Lc/a/a/a/d0/q;)V

    iput-object v0, p0, Lc/a/a/a/d0/q;->a:Lc/a/a/a/d0/q$a;

    return-void
.end method

.method public static a(Landroid/view/View;)Lc/a/a/a/d0/q;
    .registers 6

    .line 1
    invoke-static {p0}, Lc/a/a/a/d0/t;->a(Landroid/view/View;)Landroid/view/ViewGroup;

    move-result-object v0

    if-eqz v0, :cond_27

    .line 2
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_b
    if-ge v2, v1, :cond_1d

    .line 3
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 4
    instance-of v4, v3, Lc/a/a/a/d0/q$a;

    if-eqz v4, :cond_1a

    .line 5
    check-cast v3, Lc/a/a/a/d0/q$a;

    iget-object p0, v3, Lc/a/a/a/d0/q$a;->k:Lc/a/a/a/d0/q;

    return-object p0

    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 6
    :cond_1d
    new-instance v1, Lc/a/a/a/d0/o;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, v0, p0}, Lc/a/a/a/d0/o;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/View;)V

    return-object v1

    :cond_27
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public a(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 7
    iget-object v0, p0, Lc/a/a/a/d0/q;->a:Lc/a/a/a/d0/q$a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/q$a;->a(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public b(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/q;->a:Lc/a/a/a/d0/q$a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/q$a;->b(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
