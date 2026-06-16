.class public Lc/a/a/a/i0/d$b;
.super Lc/a/a/a/i0/f;
.source "TextAppearance.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/i0/d;->a(Landroid/content/Context;Landroid/text/TextPaint;Lc/a/a/a/i0/f;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/text/TextPaint;

.field public final synthetic b:Lc/a/a/a/i0/f;

.field public final synthetic c:Lc/a/a/a/i0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/i0/d;Landroid/text/TextPaint;Lc/a/a/a/i0/f;)V
    .registers 4

    .line 1
    iput-object p1, p0, Lc/a/a/a/i0/d$b;->c:Lc/a/a/a/i0/d;

    iput-object p2, p0, Lc/a/a/a/i0/d$b;->a:Landroid/text/TextPaint;

    iput-object p3, p0, Lc/a/a/a/i0/d$b;->b:Lc/a/a/a/i0/f;

    invoke-direct {p0}, Lc/a/a/a/i0/f;-><init>()V

    return-void
.end method


# virtual methods
.method public a(I)V
    .registers 3

    .line 3
    iget-object v0, p0, Lc/a/a/a/i0/d$b;->b:Lc/a/a/a/i0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/i0/f;->a(I)V

    return-void
.end method

.method public a(Landroid/graphics/Typeface;Z)V
    .registers 5

    .line 1
    iget-object v0, p0, Lc/a/a/a/i0/d$b;->c:Lc/a/a/a/i0/d;

    iget-object v1, p0, Lc/a/a/a/i0/d$b;->a:Landroid/text/TextPaint;

    invoke-virtual {v0, v1, p1}, Lc/a/a/a/i0/d;->a(Landroid/text/TextPaint;Landroid/graphics/Typeface;)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/i0/d$b;->b:Lc/a/a/a/i0/f;

    invoke-virtual {v0, p1, p2}, Lc/a/a/a/i0/f;->a(Landroid/graphics/Typeface;Z)V

    return-void
.end method
