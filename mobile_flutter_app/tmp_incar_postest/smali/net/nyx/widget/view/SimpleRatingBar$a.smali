.class public final enum Lnet/nyx/widget/view/SimpleRatingBar$a;
.super Ljava/lang/Enum;
.source "SimpleRatingBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/nyx/widget/view/SimpleRatingBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lnet/nyx/widget/view/SimpleRatingBar$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum HALF:Lnet/nyx/widget/view/SimpleRatingBar$a;

.field public static final enum ONE:Lnet/nyx/widget/view/SimpleRatingBar$a;

.field public static final synthetic h:[Lnet/nyx/widget/view/SimpleRatingBar$a;


# direct methods
.method public static constructor <clinit>()V
    .registers 5

    .line 1
    new-instance v0, Lnet/nyx/widget/view/SimpleRatingBar$a;

    const/4 v1, 0x0

    const-string v2, "HALF"

    invoke-direct {v0, v2, v1}, Lnet/nyx/widget/view/SimpleRatingBar$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnet/nyx/widget/view/SimpleRatingBar$a;->HALF:Lnet/nyx/widget/view/SimpleRatingBar$a;

    .line 2
    new-instance v0, Lnet/nyx/widget/view/SimpleRatingBar$a;

    const/4 v2, 0x1

    const-string v3, "ONE"

    invoke-direct {v0, v3, v2}, Lnet/nyx/widget/view/SimpleRatingBar$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnet/nyx/widget/view/SimpleRatingBar$a;->ONE:Lnet/nyx/widget/view/SimpleRatingBar$a;

    const/4 v3, 0x2

    new-array v3, v3, [Lnet/nyx/widget/view/SimpleRatingBar$a;

    .line 3
    sget-object v4, Lnet/nyx/widget/view/SimpleRatingBar$a;->HALF:Lnet/nyx/widget/view/SimpleRatingBar$a;

    aput-object v4, v3, v1

    aput-object v0, v3, v2

    sput-object v3, Lnet/nyx/widget/view/SimpleRatingBar$a;->h:[Lnet/nyx/widget/view/SimpleRatingBar$a;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnet/nyx/widget/view/SimpleRatingBar$a;
    .registers 2

    .line 1
    const-class v0, Lnet/nyx/widget/view/SimpleRatingBar$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnet/nyx/widget/view/SimpleRatingBar$a;

    return-object p0
.end method

.method public static values()[Lnet/nyx/widget/view/SimpleRatingBar$a;
    .registers 1

    .line 1
    sget-object v0, Lnet/nyx/widget/view/SimpleRatingBar$a;->h:[Lnet/nyx/widget/view/SimpleRatingBar$a;

    invoke-virtual {v0}, [Lnet/nyx/widget/view/SimpleRatingBar$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnet/nyx/widget/view/SimpleRatingBar$a;

    return-object v0
.end method
