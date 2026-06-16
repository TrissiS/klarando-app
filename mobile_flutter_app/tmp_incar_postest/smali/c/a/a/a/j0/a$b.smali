.class public final Lc/a/a/a/j0/a$b;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "RippleDrawableCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/j0/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:Lc/a/a/a/l0/h;

.field public b:Z


# direct methods
.method public constructor <init>(Lc/a/a/a/j0/a$b;)V
    .registers 3

    .line 4
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 5
    iget-object v0, p1, Lc/a/a/a/j0/a$b;->a:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lc/a/a/a/l0/h;

    iput-object v0, p0, Lc/a/a/a/j0/a$b;->a:Lc/a/a/a/l0/h;

    .line 6
    iget-boolean p1, p1, Lc/a/a/a/j0/a$b;->b:Z

    iput-boolean p1, p0, Lc/a/a/a/j0/a$b;->b:Z

    return-void
.end method

.method public constructor <init>(Lc/a/a/a/l0/h;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 2
    iput-object p1, p0, Lc/a/a/a/j0/a$b;->a:Lc/a/a/a/l0/h;

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lc/a/a/a/j0/a$b;->b:Z

    return-void
.end method


# virtual methods
.method public getChangingConfigurations()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic newDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/j0/a$b;->newDrawable()Lc/a/a/a/j0/a;

    move-result-object v0

    return-object v0
.end method

.method public newDrawable()Lc/a/a/a/j0/a;
    .registers 4

    .line 2
    new-instance v0, Lc/a/a/a/j0/a;

    new-instance v1, Lc/a/a/a/j0/a$b;

    invoke-direct {v1, p0}, Lc/a/a/a/j0/a$b;-><init>(Lc/a/a/a/j0/a$b;)V

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lc/a/a/a/j0/a;-><init>(Lc/a/a/a/j0/a$b;Lc/a/a/a/j0/a$a;)V

    return-object v0
.end method
