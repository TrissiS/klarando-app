.class public Lc/a/a/a/i0/d$a;
.super Lb/h/e/c/f$a;
.source "TextAppearance.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/i0/d;->a(Landroid/content/Context;Lc/a/a/a/i0/f;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/i0/f;

.field public final synthetic b:Lc/a/a/a/i0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/i0/d;Lc/a/a/a/i0/f;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/i0/d$a;->b:Lc/a/a/a/i0/d;

    iput-object p2, p0, Lc/a/a/a/i0/d$a;->a:Lc/a/a/a/i0/f;

    invoke-direct {p0}, Lb/h/e/c/f$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(I)V
    .registers 4

    .line 4
    iget-object v0, p0, Lc/a/a/a/i0/d$a;->b:Lc/a/a/a/i0/d;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lc/a/a/a/i0/d;->a(Lc/a/a/a/i0/d;Z)Z

    .line 5
    iget-object v0, p0, Lc/a/a/a/i0/d$a;->a:Lc/a/a/a/i0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/i0/f;->a(I)V

    return-void
.end method

.method public a(Landroid/graphics/Typeface;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/i0/d$a;->b:Lc/a/a/a/i0/d;

    iget v1, v0, Lc/a/a/a/i0/d;->d:I

    invoke-static {p1, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-static {v0, p1}, Lc/a/a/a/i0/d;->a(Lc/a/a/a/i0/d;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 2
    iget-object p1, p0, Lc/a/a/a/i0/d$a;->b:Lc/a/a/a/i0/d;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lc/a/a/a/i0/d;->a(Lc/a/a/a/i0/d;Z)Z

    .line 3
    iget-object p1, p0, Lc/a/a/a/i0/d$a;->a:Lc/a/a/a/i0/f;

    iget-object v0, p0, Lc/a/a/a/i0/d$a;->b:Lc/a/a/a/i0/d;

    invoke-static {v0}, Lc/a/a/a/i0/d;->a(Lc/a/a/a/i0/d;)Landroid/graphics/Typeface;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lc/a/a/a/i0/f;->a(Landroid/graphics/Typeface;Z)V

    return-void
.end method
