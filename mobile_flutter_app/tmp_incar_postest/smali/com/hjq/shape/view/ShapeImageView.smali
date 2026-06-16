.class public Lcom/hjq/shape/view/ShapeImageView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "ShapeImageView.java"


# static fields
.field public static final k:Lc/c/c/f/k;


# instance fields
.field public final j:Lc/c/c/c/b;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lc/c/c/f/k;

    invoke-direct {v0}, Lc/c/c/f/k;-><init>()V

    sput-object v0, Lcom/hjq/shape/view/ShapeImageView;->k:Lc/c/c/f/k;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/hjq/shape/view/ShapeImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/hjq/shape/view/ShapeImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    sget-object p3, Lc/c/c/b;->ShapeImageView:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 5
    new-instance p2, Lc/c/c/c/b;

    sget-object p3, Lcom/hjq/shape/view/ShapeImageView;->k:Lc/c/c/f/k;

    invoke-direct {p2, p0, p1, p3}, Lc/c/c/c/b;-><init>(Landroid/view/View;Landroid/content/res/TypedArray;Lc/c/c/f/c;)V

    iput-object p2, p0, Lcom/hjq/shape/view/ShapeImageView;->j:Lc/c/c/c/b;

    .line 6
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 7
    iget-object p1, p0, Lcom/hjq/shape/view/ShapeImageView;->j:Lc/c/c/c/b;

    invoke-virtual {p1}, Lc/c/c/c/b;->b()V

    return-void
.end method


# virtual methods
.method public getShapeDrawableBuilder()Lc/c/c/c/b;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/hjq/shape/view/ShapeImageView;->j:Lc/c/c/c/b;

    return-object v0
.end method
