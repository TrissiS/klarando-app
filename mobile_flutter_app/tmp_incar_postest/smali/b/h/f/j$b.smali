.class public Lb/h/f/j$b;
.super Ljava/lang/Object;
.source "TypefaceCompatBaseImpl.java"

# interfaces
.implements Lb/h/f/j$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/f/j;->a(Lb/h/e/c/c$b;I)Lb/h/e/c/c$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lb/h/f/j$c<",
        "Lb/h/e/c/c$c;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lb/h/f/j;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/h/e/c/c$c;)I
    .registers 2

    .line 2
    invoke-virtual {p1}, Lb/h/e/c/c$c;->e()I

    move-result p1

    return p1
.end method

.method public bridge synthetic a(Ljava/lang/Object;)I
    .registers 2

    .line 1
    check-cast p1, Lb/h/e/c/c$c;

    invoke-virtual {p0, p1}, Lb/h/f/j$b;->a(Lb/h/e/c/c$c;)I

    move-result p1

    return p1
.end method

.method public b(Lb/h/e/c/c$c;)Z
    .registers 2

    .line 2
    invoke-virtual {p1}, Lb/h/e/c/c$c;->f()Z

    move-result p1

    return p1
.end method

.method public bridge synthetic b(Ljava/lang/Object;)Z
    .registers 2

    .line 1
    check-cast p1, Lb/h/e/c/c$c;

    invoke-virtual {p0, p1}, Lb/h/f/j$b;->b(Lb/h/e/c/c$c;)Z

    move-result p1

    return p1
.end method
