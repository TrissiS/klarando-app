.class public Lb/h/f/j$a;
.super Ljava/lang/Object;
.source "TypefaceCompatBaseImpl.java"

# interfaces
.implements Lb/h/f/j$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/f/j;->a([Lb/h/j/f$b;I)Lb/h/j/f$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lb/h/f/j$c<",
        "Lb/h/j/f$b;",
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
.method public a(Lb/h/j/f$b;)I
    .registers 2

    .line 2
    invoke-virtual {p1}, Lb/h/j/f$b;->d()I

    move-result p1

    return p1
.end method

.method public bridge synthetic a(Ljava/lang/Object;)I
    .registers 2

    .line 1
    check-cast p1, Lb/h/j/f$b;

    invoke-virtual {p0, p1}, Lb/h/f/j$a;->a(Lb/h/j/f$b;)I

    move-result p1

    return p1
.end method

.method public b(Lb/h/j/f$b;)Z
    .registers 2

    .line 2
    invoke-virtual {p1}, Lb/h/j/f$b;->e()Z

    move-result p1

    return p1
.end method

.method public bridge synthetic b(Ljava/lang/Object;)Z
    .registers 2

    .line 1
    check-cast p1, Lb/h/j/f$b;

    invoke-virtual {p0, p1}, Lb/h/f/j$a;->b(Lb/h/j/f$b;)Z

    move-result p1

    return p1
.end method
