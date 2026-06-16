.class public abstract Landroidx/viewpager2/widget/ViewPager2$e;
.super Ljava/lang/Object;
.source "ViewPager2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/viewpager2/widget/ViewPager2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "e"
.end annotation


# direct methods
.method public constructor <init>(Landroidx/viewpager2/widget/ViewPager2;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Landroidx/viewpager2/widget/ViewPager2;Landroidx/viewpager2/widget/ViewPager2$a;)V
    .registers 3

    .line 2
    invoke-direct {p0, p1}, Landroidx/viewpager2/widget/ViewPager2$e;-><init>(Landroidx/viewpager2/widget/ViewPager2;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 2

    return-void
.end method

.method public a(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 2

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$g;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$g<",
            "*>;)V"
        }
    .end annotation

    return-void
.end method

.method public a(Lb/h/m/h0/c;)V
    .registers 2

    return-void
.end method

.method public a(Lb/w/c/b;Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    return-void
.end method

.method public a()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public a(I)Z
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public a(ILandroid/os/Bundle;)Z
    .registers 3

    const/4 p1, 0x0

    return p1
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView$g;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$g<",
            "*>;)V"
        }
    .end annotation

    return-void
.end method

.method public b()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public b(I)Z
    .registers 3

    .line 2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Not implemented."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public b(ILandroid/os/Bundle;)Z
    .registers 3

    .line 1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Not implemented."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public c()Ljava/lang/String;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not implemented."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public d()V
    .registers 1

    return-void
.end method

.method public e()Ljava/lang/CharSequence;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not implemented."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public f()V
    .registers 1

    return-void
.end method

.method public g()V
    .registers 1

    return-void
.end method

.method public h()V
    .registers 1

    return-void
.end method

.method public i()V
    .registers 1

    return-void
.end method
