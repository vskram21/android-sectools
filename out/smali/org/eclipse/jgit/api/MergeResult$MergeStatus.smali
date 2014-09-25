.class public abstract enum Lorg/eclipse/jgit/api/MergeResult$MergeStatus;
.super Ljava/lang/Enum;
.source "MergeResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/MergeResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "MergeStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/api/MergeResult$MergeStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

.field public static final enum ABORTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

.field public static final enum ALREADY_UP_TO_DATE:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

.field public static final enum CHECKOUT_CONFLICT:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

.field public static final enum CONFLICTING:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

.field public static final enum FAILED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

.field public static final enum FAST_FORWARD:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

.field public static final enum FAST_FORWARD_SQUASHED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

.field public static final enum MERGED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

.field public static final enum MERGED_NOT_COMMITTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

.field public static final enum MERGED_SQUASHED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

.field public static final enum MERGED_SQUASHED_NOT_COMMITTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

.field public static final enum NOT_SUPPORTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 69
    new-instance v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$1;

    const-string v1, "FAST_FORWARD"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->FAST_FORWARD:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 83
    new-instance v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$2;

    const-string v1, "FAST_FORWARD_SQUASHED"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->FAST_FORWARD_SQUASHED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 95
    new-instance v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$3;

    const-string v1, "ALREADY_UP_TO_DATE"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->ALREADY_UP_TO_DATE:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 107
    new-instance v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$4;

    const-string v1, "FAILED"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->FAILED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 119
    new-instance v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$5;

    const-string v1, "MERGED"

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$5;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->MERGED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 133
    new-instance v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$6;

    const-string v1, "MERGED_SQUASHED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$6;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->MERGED_SQUASHED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 147
    new-instance v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$7;

    const-string v1, "MERGED_SQUASHED_NOT_COMMITTED"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$7;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->MERGED_SQUASHED_NOT_COMMITTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 159
    new-instance v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$8;

    const-string v1, "CONFLICTING"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$8;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->CONFLICTING:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 173
    new-instance v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$9;

    const-string v1, "ABORTED"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$9;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->ABORTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 187
    new-instance v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$10;

    const-string v1, "MERGED_NOT_COMMITTED"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$10;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->MERGED_NOT_COMMITTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 198
    new-instance v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$11;

    const-string v1, "NOT_SUPPORTED"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$11;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->NOT_SUPPORTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 214
    new-instance v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$12;

    const-string v1, "CHECKOUT_CONFLICT"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus$12;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->CHECKOUT_CONFLICT:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 67
    const/16 v0, 0xc

    new-array v0, v0, [Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    sget-object v1, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->FAST_FORWARD:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->FAST_FORWARD_SQUASHED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->ALREADY_UP_TO_DATE:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->FAILED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    aput-object v1, v0, v6

    sget-object v1, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->MERGED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->MERGED_SQUASHED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->MERGED_SQUASHED_NOT_COMMITTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->CONFLICTING:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->ABORTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->MERGED_NOT_COMMITTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->NOT_SUPPORTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->CHECKOUT_CONFLICT:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    aput-object v2, v0, v1

    sput-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->$VALUES:[Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

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
    .line 67
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILorg/eclipse/jgit/api/MergeResult$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 67
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/api/MergeResult$MergeStatus;
    .locals 1
    .parameter "name"

    .prologue
    .line 67
    const-class v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/api/MergeResult$MergeStatus;
    .locals 1

    .prologue
    .line 67
    sget-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->$VALUES:[Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    return-object v0
.end method


# virtual methods
.method public abstract isSuccessful()Z
.end method
