.class public Lb/b/q/z$c;
.super Ljava/lang/Object;
.source "ScrollingTabContainerView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/q/z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic h:Lb/b/q/z;


# direct methods
.method public constructor <init>(Lb/b/q/z;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/q/z$c;->h:Lb/b/q/z;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 7

    .line 1
    move-object v0, p1

    check-cast v0, Lb/b/q/z$d;

    .line 2
    invoke-virtual {v0}, Lb/b/q/z$d;->a()Landroidx/appcompat/app/ActionBar$b;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/appcompat/app/ActionBar$b;->e()V

    .line 3
    iget-object v0, p0, Lb/b/q/z$c;->h:Lb/b/q/z;

    iget-object v0, v0, Lb/b/q/z;->j:Landroidx/appcompat/widget/LinearLayoutCompat;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_14
    if-ge v2, v0, :cond_29

    .line 4
    iget-object v3, p0, Lb/b/q/z$c;->h:Lb/b/q/z;

    iget-object v3, v3, Lb/b/q/z;->j:Landroidx/appcompat/widget/LinearLayoutCompat;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    if-ne v3, p1, :cond_22

    const/4 v4, 0x1

    goto :goto_23

    :cond_22
    const/4 v4, 0x0

    .line 5
    :goto_23
    invoke-virtual {v3, v4}, Landroid/view/View;->setSelected(Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    :cond_29
    return-void
.end method
