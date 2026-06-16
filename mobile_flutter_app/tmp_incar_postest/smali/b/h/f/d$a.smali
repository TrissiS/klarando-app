.class public Lb/h/f/d$a;
.super Lb/h/j/f$c;
.source "TypefaceCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/f/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lb/h/e/c/f$a;


# direct methods
.method public constructor <init>(Lb/h/e/c/f$a;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/h/j/f$c;-><init>()V

    .line 2
    iput-object p1, p0, Lb/h/f/d$a;->a:Lb/h/e/c/f$a;

    return-void
.end method


# virtual methods
.method public a(I)V
    .registers 3

    .line 3
    iget-object v0, p0, Lb/h/f/d$a;->a:Lb/h/e/c/f$a;

    if-eqz v0, :cond_7

    .line 4
    invoke-virtual {v0, p1}, Lb/h/e/c/f$a;->a(I)V

    :cond_7
    return-void
.end method

.method public a(Landroid/graphics/Typeface;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/f/d$a;->a:Lb/h/e/c/f$a;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lb/h/e/c/f$a;->a(Landroid/graphics/Typeface;)V

    :cond_7
    return-void
.end method
