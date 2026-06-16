.class public final Landroidx/appcompat/view/menu/ExpandedMenuView;
.super Landroid/widget/ListView;
.source "ExpandedMenuView.java"

# interfaces
.implements Lb/b/p/j/g$b;
.implements Lb/b/p/j/n;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# static fields
.field public static final j:[I


# instance fields
.field public h:Lb/b/p/j/g;

.field public i:I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 1
    fill-array-data v0, :array_a

    sput-object v0, Landroidx/appcompat/view/menu/ExpandedMenuView;->j:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x10100d4
        0x1010129
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const v0, 0x1010074

    .line 1
    invoke-direct {p0, p1, p2, v0}, Landroidx/appcompat/view/menu/ExpandedMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6

    .line 2
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    invoke-virtual {p0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 4
    sget-object v0, Landroidx/appcompat/view/menu/ExpandedMenuView;->j:[I

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, p3, v1}, Lb/b/q/g0;->a(Landroid/content/Context;Landroid/util/AttributeSet;[III)Lb/b/q/g0;

    move-result-object p1

    .line 5
    invoke-virtual {p1, v1}, Lb/b/q/g0;->g(I)Z

    move-result p2

    if-eqz p2, :cond_1a

    .line 6
    invoke-virtual {p1, v1}, Lb/b/q/g0;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/widget/ListView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_1a
    const/4 p2, 0x1

    .line 7
    invoke-virtual {p1, p2}, Lb/b/q/g0;->g(I)Z

    move-result p3

    if-eqz p3, :cond_28

    .line 8
    invoke-virtual {p1, p2}, Lb/b/q/g0;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 9
    :cond_28
    invoke-virtual {p1}, Lb/b/q/g0;->b()V

    return-void
.end method


# virtual methods
.method public a(Lb/b/p/j/g;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/appcompat/view/menu/ExpandedMenuView;->h:Lb/b/p/j/g;

    return-void
.end method

.method public a(Lb/b/p/j/i;)Z
    .registers 4

    .line 2
    iget-object v0, p0, Landroidx/appcompat/view/menu/ExpandedMenuView;->h:Lb/b/p/j/g;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lb/b/p/j/g;->a(Landroid/view/MenuItem;I)Z

    move-result p1

    return p1
.end method

.method public getWindowAnimations()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/appcompat/view/menu/ExpandedMenuView;->i:I

    return v0
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/ListView;->onDetachedFromWindow()V

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/ListView;->setChildrenDrawingCacheEnabled(Z)V

    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6

    .line 1
    invoke-virtual {p0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    invoke-interface {p1, p3}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/b/p/j/i;

    invoke-virtual {p0, p1}, Landroidx/appcompat/view/menu/ExpandedMenuView;->a(Lb/b/p/j/i;)Z

    return-void
.end method
