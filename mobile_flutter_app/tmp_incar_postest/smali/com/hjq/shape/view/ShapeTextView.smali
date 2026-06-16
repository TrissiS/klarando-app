.class public Lcom/hjq/shape/view/ShapeTextView;
.super Landroidx/appcompat/widget/AppCompatTextView;
.source "ShapeTextView.java"


# static fields
.field public static final o:Lc/c/c/f/p;


# instance fields
.field public final m:Lc/c/c/c/b;

.field public final n:Lc/c/c/c/c;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lc/c/c/f/p;

    invoke-direct {v0}, Lc/c/c/f/p;-><init>()V

    sput-object v0, Lcom/hjq/shape/view/ShapeTextView;->o:Lc/c/c/f/p;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/hjq/shape/view/ShapeTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const v0, 0x1010084

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/hjq/shape/view/ShapeTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    sget-object p3, Lc/c/c/b;->ShapeTextView:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 5
    new-instance p2, Lc/c/c/c/b;

    sget-object p3, Lcom/hjq/shape/view/ShapeTextView;->o:Lc/c/c/f/p;

    invoke-direct {p2, p0, p1, p3}, Lc/c/c/c/b;-><init>(Landroid/view/View;Landroid/content/res/TypedArray;Lc/c/c/f/c;)V

    iput-object p2, p0, Lcom/hjq/shape/view/ShapeTextView;->m:Lc/c/c/c/b;

    .line 6
    new-instance p2, Lc/c/c/c/c;

    sget-object p3, Lcom/hjq/shape/view/ShapeTextView;->o:Lc/c/c/f/p;

    invoke-direct {p2, p0, p1, p3}, Lc/c/c/c/c;-><init>(Landroid/widget/TextView;Landroid/content/res/TypedArray;Lc/c/c/f/e;)V

    iput-object p2, p0, Lcom/hjq/shape/view/ShapeTextView;->n:Lc/c/c/c/c;

    .line 7
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 8
    iget-object p1, p0, Lcom/hjq/shape/view/ShapeTextView;->m:Lc/c/c/c/b;

    invoke-virtual {p1}, Lc/c/c/c/b;->b()V

    .line 9
    iget-object p1, p0, Lcom/hjq/shape/view/ShapeTextView;->n:Lc/c/c/c/c;

    invoke-virtual {p1}, Lc/c/c/c/c;->d()Z

    move-result p1

    if-eqz p1, :cond_33

    .line 10
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_38

    .line 11
    :cond_33
    iget-object p1, p0, Lcom/hjq/shape/view/ShapeTextView;->n:Lc/c/c/c/c;

    invoke-virtual {p1}, Lc/c/c/c/c;->c()V

    :goto_38
    return-void
.end method


# virtual methods
.method public getShapeDrawableBuilder()Lc/c/c/c/b;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/hjq/shape/view/ShapeTextView;->m:Lc/c/c/c/b;

    return-object v0
.end method

.method public getTextColorBuilder()Lc/c/c/c/c;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/hjq/shape/view/ShapeTextView;->n:Lc/c/c/c/c;

    return-object v0
.end method

.method public setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/hjq/shape/view/ShapeTextView;->n:Lc/c/c/c/c;

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Lc/c/c/c/c;->d()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 2
    iget-object v0, p0, Lcom/hjq/shape/view/ShapeTextView;->n:Lc/c/c/c/c;

    invoke-virtual {v0, p1}, Lc/c/c/c/c;->a(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object p1

    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    goto :goto_17

    .line 3
    :cond_14
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    :goto_17
    return-void
.end method

.method public setTextColor(I)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2
    iget-object v0, p0, Lcom/hjq/shape/view/ShapeTextView;->n:Lc/c/c/c/c;

    if-nez v0, :cond_8

    return-void

    .line 3
    :cond_8
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Lc/c/c/c/c;->a(Ljava/lang/Integer;)Lc/c/c/c/c;

    .line 4
    iget-object p1, p0, Lcom/hjq/shape/view/ShapeTextView;->n:Lc/c/c/c/c;

    invoke-virtual {p1}, Lc/c/c/c/c;->b()V

    return-void
.end method
