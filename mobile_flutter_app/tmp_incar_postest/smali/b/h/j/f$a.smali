.class public Lb/h/j/f$a;
.super Ljava/lang/Object;
.source "FontsContractCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/j/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:I

.field public final b:[Lb/h/j/f$b;


# direct methods
.method public constructor <init>(I[Lb/h/j/f$b;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Lb/h/j/f$a;->a:I

    .line 3
    iput-object p2, p0, Lb/h/j/f$a;->b:[Lb/h/j/f$b;

    return-void
.end method

.method public static a(I[Lb/h/j/f$b;)Lb/h/j/f$a;
    .registers 3

    .line 2
    new-instance v0, Lb/h/j/f$a;

    invoke-direct {v0, p0, p1}, Lb/h/j/f$a;-><init>(I[Lb/h/j/f$b;)V

    return-object v0
.end method


# virtual methods
.method public a()[Lb/h/j/f$b;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/j/f$a;->b:[Lb/h/j/f$b;

    return-object v0
.end method

.method public b()I
    .registers 2

    .line 1
    iget v0, p0, Lb/h/j/f$a;->a:I

    return v0
.end method
