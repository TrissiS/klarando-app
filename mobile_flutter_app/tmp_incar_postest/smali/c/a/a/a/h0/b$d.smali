.class public Lc/a/a/a/h0/b$d;
.super Lb/t/a/a/b$a;
.source "BaseProgressIndicator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/h0/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/h0/b;


# direct methods
.method public constructor <init>(Lc/a/a/a/h0/b;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/h0/b$d;->a:Lc/a/a/a/h0/b;

    invoke-direct {p0}, Lb/t/a/a/b$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Lb/t/a/a/b$a;->a(Landroid/graphics/drawable/Drawable;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/h0/b$d;->a:Lc/a/a/a/h0/b;

    invoke-static {p1}, Lc/a/a/a/h0/b;->e(Lc/a/a/a/h0/b;)Z

    move-result p1

    if-nez p1, :cond_14

    .line 3
    iget-object p1, p0, Lc/a/a/a/h0/b$d;->a:Lc/a/a/a/h0/b;

    invoke-static {p1}, Lc/a/a/a/h0/b;->f(Lc/a/a/a/h0/b;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_14
    return-void
.end method
