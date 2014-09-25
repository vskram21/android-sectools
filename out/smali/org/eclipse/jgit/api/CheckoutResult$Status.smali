.class public final enum Lorg/eclipse/jgit/api/CheckoutResult$Status;
.super Ljava/lang/Enum;
.source "CheckoutResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/CheckoutResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/api/CheckoutResult$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/api/CheckoutResult$Status;

.field public static final enum CONFLICTS:Lorg/eclipse/jgit/api/CheckoutResult$Status;

.field public static final enum ERROR:Lorg/eclipse/jgit/api/CheckoutResult$Status;

.field public static final enum NONDELETED:Lorg/eclipse/jgit/api/CheckoutResult$Status;

.field public static final enum NOT_TRIED:Lorg/eclipse/jgit/api/CheckoutResult$Status;

.field public static final enum OK:Lorg/eclipse/jgit/api/CheckoutResult$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 73
    new-instance v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;

    const-string v1, "NOT_TRIED"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/CheckoutResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;->NOT_TRIED:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    .line 77
    new-instance v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;

    const-string v1, "OK"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/api/CheckoutResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;->OK:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    .line 81
    new-instance v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;

    const-string v1, "CONFLICTS"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/api/CheckoutResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;->CONFLICTS:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    .line 85
    new-instance v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;

    const-string v1, "NONDELETED"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/api/CheckoutResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;->NONDELETED:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    .line 89
    new-instance v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;

    const-string v1, "ERROR"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/api/CheckoutResult$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;->ERROR:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    .line 69
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/eclipse/jgit/api/CheckoutResult$Status;

    sget-object v1, Lorg/eclipse/jgit/api/CheckoutResult$Status;->NOT_TRIED:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/api/CheckoutResult$Status;->OK:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/api/CheckoutResult$Status;->CONFLICTS:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/api/CheckoutResult$Status;->NONDELETED:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/api/CheckoutResult$Status;->ERROR:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    aput-object v1, v0, v6

    sput-object v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;->$VALUES:[Lorg/eclipse/jgit/api/CheckoutResult$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 69
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/api/CheckoutResult$Status;
    .locals 1
    .parameter "name"

    .prologue
    .line 69
    const-class v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/api/CheckoutResult$Status;
    .locals 1

    .prologue
    .line 69
    sget-object v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;->$VALUES:[Lorg/eclipse/jgit/api/CheckoutResult$Status;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/api/CheckoutResult$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/api/CheckoutResult$Status;

    return-object v0
.end method
