.class public Lb/h/e/c/f$a$b;
.super Ljava/lang/Object;
.source "ResourcesCompat.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/e/c/f$a;->a(ILandroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:I

.field public final synthetic i:Lb/h/e/c/f$a;


# direct methods
.method public constructor <init>(Lb/h/e/c/f$a;I)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/h/e/c/f$a$b;->i:Lb/h/e/c/f$a;

    iput p2, p0, Lb/h/e/c/f$a$b;->h:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/e/c/f$a$b;->i:Lb/h/e/c/f$a;

    iget v1, p0, Lb/h/e/c/f$a$b;->h:I

    invoke-virtual {v0, v1}, Lb/h/e/c/f$a;->a(I)V

    return-void
.end method
