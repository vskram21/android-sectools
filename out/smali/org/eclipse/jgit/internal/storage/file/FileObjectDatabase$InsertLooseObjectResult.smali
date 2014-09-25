.class final enum Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;
.super Ljava/lang/Enum;
.source "FileObjectDatabase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "InsertLooseObjectResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

.field public static final enum EXISTS_LOOSE:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

.field public static final enum EXISTS_PACKED:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

.field public static final enum FAILURE:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

.field public static final enum INSERTED:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 64
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    const-string v1, "INSERTED"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->INSERTED:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    const-string v1, "EXISTS_PACKED"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->EXISTS_PACKED:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    const-string v1, "EXISTS_LOOSE"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->EXISTS_LOOSE:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    const-string v1, "FAILURE"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->FAILURE:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    .line 63
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->INSERTED:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->EXISTS_PACKED:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->EXISTS_LOOSE:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->FAILURE:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    aput-object v1, v0, v5

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->$VALUES:[Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

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
    .line 63
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;
    .locals 1
    .parameter "name"

    .prologue
    .line 63
    const-class v0, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;
    .locals 1

    .prologue
    .line 63
    sget-object v0, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->$VALUES:[Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    return-object v0
.end method
