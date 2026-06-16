.class public Lb/b/q/z$b;
.super Landroid/widget/BaseAdapter;
.source "ScrollingTabContainerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/q/z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic h:Lb/b/q/z;


# direct methods
.method public constructor <init>(Lb/b/q/z;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/q/z$b;->h:Lb/b/q/z;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/z$b;->h:Lb/b/q/z;

    iget-object v0, v0, Lb/b/q/z;->j:Landroidx/appcompat/widget/LinearLayoutCompat;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/q/z$b;->h:Lb/b/q/z;

    iget-object v0, v0, Lb/b/q/z;->j:Landroidx/appcompat/widget/LinearLayoutCompat;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lb/b/q/z$d;

    invoke-virtual {p1}, Lb/b/q/z$d;->a()Landroidx/appcompat/app/ActionBar$b;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 4

    if-nez p2, :cond_10

    .line 1
    iget-object p2, p0, Lb/b/q/z$b;->h:Lb/b/q/z;

    invoke-virtual {p0, p1}, Lb/b/q/z$b;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/app/ActionBar$b;

    const/4 p3, 0x1

    invoke-virtual {p2, p1, p3}, Lb/b/q/z;->a(Landroidx/appcompat/app/ActionBar$b;Z)Lb/b/q/z$d;

    move-result-object p2

    goto :goto_1c

    .line 2
    :cond_10
    move-object p3, p2

    check-cast p3, Lb/b/q/z$d;

    invoke-virtual {p0, p1}, Lb/b/q/z$b;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/app/ActionBar$b;

    invoke-virtual {p3, p1}, Lb/b/q/z$d;->a(Landroidx/appcompat/app/ActionBar$b;)V

    :goto_1c
    return-object p2
.end method
