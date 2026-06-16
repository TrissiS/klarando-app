.class public final Lc/c/a/g$a;
.super Ljava/lang/Object;
.source "SelectorDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/c/a/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/graphics/drawable/Drawable;

.field public b:Landroid/graphics/drawable/Drawable;

.field public c:Landroid/graphics/drawable/Drawable;

.field public d:Landroid/graphics/drawable/Drawable;

.field public e:Landroid/graphics/drawable/Drawable;

.field public f:Landroid/graphics/drawable/Drawable;

.field public g:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/drawable/Drawable;)Lc/c/a/g$a;
    .registers 2

    .line 1
    iput-object p1, p0, Lc/c/a/g$a;->a:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public a()Lc/c/a/g;
    .registers 7

    .line 2
    new-instance v0, Lc/c/a/g;

    invoke-direct {v0}, Lc/c/a/g;-><init>()V

    .line 3
    iget-object v1, p0, Lc/c/a/g$a;->c:Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_15

    new-array v4, v2, [I

    const v5, 0x10100a7

    aput v5, v4, v3

    .line 4
    invoke-virtual {v0, v4, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 5
    :cond_15
    iget-object v1, p0, Lc/c/a/g$a;->b:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_23

    new-array v4, v2, [I

    const v5, 0x101009c

    aput v5, v4, v3

    .line 6
    invoke-virtual {v0, v4, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 7
    :cond_23
    iget-object v1, p0, Lc/c/a/g$a;->d:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_31

    new-array v4, v2, [I

    const v5, 0x10100a0

    aput v5, v4, v3

    .line 8
    invoke-virtual {v0, v4, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 9
    :cond_31
    iget-object v1, p0, Lc/c/a/g$a;->e:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_3f

    new-array v4, v2, [I

    const v5, 0x101009e

    aput v5, v4, v3

    .line 10
    invoke-virtual {v0, v4, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 11
    :cond_3f
    iget-object v1, p0, Lc/c/a/g$a;->f:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_4d

    new-array v4, v2, [I

    const v5, 0x10100a1

    aput v5, v4, v3

    .line 12
    invoke-virtual {v0, v4, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 13
    :cond_4d
    iget-object v1, p0, Lc/c/a/g$a;->g:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_5b

    new-array v2, v2, [I

    const v4, 0x1010367

    aput v4, v2, v3

    .line 14
    invoke-virtual {v0, v2, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 15
    :cond_5b
    iget-object v1, p0, Lc/c/a/g$a;->a:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_64

    new-array v2, v3, [I

    .line 16
    invoke-virtual {v0, v2, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    :cond_64
    return-object v0
.end method

.method public b(Landroid/graphics/drawable/Drawable;)Lc/c/a/g$a;
    .registers 2

    .line 1
    iput-object p1, p0, Lc/c/a/g$a;->b:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public c(Landroid/graphics/drawable/Drawable;)Lc/c/a/g$a;
    .registers 2

    .line 1
    iput-object p1, p0, Lc/c/a/g$a;->c:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method
