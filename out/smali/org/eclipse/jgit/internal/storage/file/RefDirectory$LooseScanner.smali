.class Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;
.super Ljava/lang/Object;
.source "RefDirectory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/RefDirectory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LooseScanner"
.end annotation


# instance fields
.field private curIdx:I

.field private final curLoose:Lorg/eclipse/jgit/util/RefList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;",
            ">;"
        }
    .end annotation
.end field

.field newLoose:Lorg/eclipse/jgit/util/RefList$Builder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/RefList$Builder",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;",
            ">;"
        }
    .end annotation
.end field

.field final symbolic:Lorg/eclipse/jgit/util/RefList$Builder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/RefList$Builder",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;Lorg/eclipse/jgit/util/RefList;)V
    .locals 2
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 346
    .local p2, curLoose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->this$0:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 342
    new-instance v0, Lorg/eclipse/jgit/util/RefList$Builder;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/RefList$Builder;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->symbolic:Lorg/eclipse/jgit/util/RefList$Builder;

    .line 347
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    .line 348
    return-void
.end method

.method private scanOne(Ljava/lang/String;)V
    .locals 6
    .parameter "name"

    .prologue
    .line 408
    iget v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v5}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v5

    if-ge v4, v5, :cond_8

    .line 410
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;

    .line 411
    .local v1, cur:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    invoke-static {v1, p1}, Lorg/eclipse/jgit/lib/RefComparator;->compareTo(Lorg/eclipse/jgit/lib/Ref;Ljava/lang/String;)I

    move-result v0

    .line 412
    .local v0, cmp:I
    if-gez v0, :cond_7

    .line 415
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    if-nez v4, :cond_1

    .line 416
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/RefList;->copy(I)Lorg/eclipse/jgit/util/RefList$Builder;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    .line 417
    :cond_1
    iget v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    .line 418
    const/4 v1, 0x0

    .line 425
    iget v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v5}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v5

    if-lt v4, v5, :cond_0

    .line 431
    .end local v0           #cmp:I
    :cond_2
    :goto_0
    :try_start_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->this$0:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    #calls: Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->scanRef(Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    invoke-static {v4, v1, p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->access$100(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 436
    .local v2, n:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    :goto_1
    if-eqz v2, :cond_9

    .line 437
    if-eq v1, v2, :cond_3

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    if-nez v4, :cond_3

    .line 438
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/RefList;->copy(I)Lorg/eclipse/jgit/util/RefList$Builder;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    .line 439
    :cond_3
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    if-eqz v4, :cond_4

    .line 440
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    invoke-virtual {v4, v2}, Lorg/eclipse/jgit/util/RefList$Builder;->add(Lorg/eclipse/jgit/lib/Ref;)V

    .line 441
    :cond_4
    invoke-interface {v2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;->isSymbolic()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 442
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->symbolic:Lorg/eclipse/jgit/util/RefList$Builder;

    invoke-virtual {v4, v2}, Lorg/eclipse/jgit/util/RefList$Builder;->add(Lorg/eclipse/jgit/lib/Ref;)V

    .line 450
    :cond_5
    :goto_2
    if-eqz v1, :cond_6

    .line 451
    iget v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    .line 452
    :cond_6
    return-void

    .line 422
    .end local v2           #n:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    .restart local v0       #cmp:I
    :cond_7
    if-lez v0, :cond_2

    .line 423
    const/4 v1, 0x0

    goto :goto_0

    .line 427
    .end local v0           #cmp:I
    .end local v1           #cur:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    :cond_8
    const/4 v1, 0x0

    .restart local v1       #cur:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    goto :goto_0

    .line 432
    :catch_0
    move-exception v3

    .line 433
    .local v3, notValid:Ljava/io/IOException;
    const/4 v2, 0x0

    .restart local v2       #n:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    goto :goto_1

    .line 443
    .end local v3           #notValid:Ljava/io/IOException;
    :cond_9
    if-eqz v1, :cond_5

    .line 446
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    if-nez v4, :cond_5

    .line 447
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/RefList;->copy(I)Lorg/eclipse/jgit/util/RefList$Builder;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    goto :goto_2
.end method

.method private scanTree(Ljava/lang/String;Ljava/io/File;)Z
    .locals 11
    .parameter "prefix"
    .parameter "dir"

    .prologue
    const/16 v10, 0x2f

    .line 384
    sget-object v8, Lorg/eclipse/jgit/internal/storage/file/LockFile;->FILTER:Ljava/io/FilenameFilter;

    invoke-virtual {p2, v8}, Ljava/io/File;->list(Ljava/io/FilenameFilter;)[Ljava/lang/String;

    move-result-object v2

    .line 385
    .local v2, entries:[Ljava/lang/String;
    if-nez v2, :cond_0

    .line 386
    const/4 v8, 0x0

    .line 402
    :goto_0
    return v8

    .line 387
    :cond_0
    array-length v8, v2

    if-lez v8, :cond_4

    .line 388
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    array-length v8, v2

    if-ge v4, v8, :cond_2

    .line 389
    aget-object v1, v2, v4

    .line 390
    .local v1, e:Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 391
    .local v3, f:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 392
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v9, v2, v4

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v2, v4

    .line 388
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 394
    .end local v1           #e:Ljava/lang/String;
    .end local v3           #f:Ljava/io/File;
    :cond_2
    invoke-static {v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 395
    move-object v0, v2

    .local v0, arr$:[Ljava/lang/String;
    array-length v6, v0

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_2
    if-ge v5, v6, :cond_4

    aget-object v7, v0, v5

    .line 396
    .local v7, name:Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-ne v8, v10, :cond_3

    .line 397
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/io/File;

    invoke-direct {v9, p2, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {p0, v8, v9}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->scanTree(Ljava/lang/String;Ljava/io/File;)Z

    .line 395
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 399
    :cond_3
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->scanOne(Ljava/lang/String;)V

    goto :goto_3

    .line 402
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v4           #i:I
    .end local v5           #i$:I
    .end local v6           #len$:I
    .end local v7           #name:Ljava/lang/String;
    :cond_4
    const/4 v8, 0x1

    goto :goto_0
.end method


# virtual methods
.method scan(Ljava/lang/String;)V
    .locals 5
    .parameter "prefix"

    .prologue
    .line 351
    const-string v1, ""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 352
    const-string v1, "HEAD"

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->scanOne(Ljava/lang/String;)V

    .line 353
    const-string v1, "refs/"

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->this$0:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->refsDir:Ljava/io/File;
    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->access$000(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;)Ljava/io/File;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->scanTree(Ljava/lang/String;Ljava/io/File;)Z

    .line 356
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    if-nez v1, :cond_0

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v2}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 357
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/util/RefList;->copy(I)Lorg/eclipse/jgit/util/RefList$Builder;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    .line 381
    :cond_0
    return-void

    .line 359
    :cond_1
    const-string v1, "refs/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 360
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    neg-int v1, v1

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    .line 361
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->this$0:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->refsDir:Ljava/io/File;
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->access$000(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;)Ljava/io/File;

    move-result-object v1

    const-string v2, "refs/"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 362
    .local v0, dir:Ljava/io/File;
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->scanTree(Ljava/lang/String;Ljava/io/File;)Z

    .line 366
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v2}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 367
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;

    invoke-interface {v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 376
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    if-eqz v1, :cond_0

    .line 377
    :goto_1
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v2}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 378
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/util/RefList$Builder;->add(Lorg/eclipse/jgit/lib/Ref;)V

    goto :goto_1

    .line 369
    :cond_3
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    if-nez v1, :cond_4

    .line 370
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curLoose:Lorg/eclipse/jgit/util/RefList;

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/util/RefList;->copy(I)Lorg/eclipse/jgit/util/RefList$Builder;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    .line 371
    :cond_4
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->curIdx:I

    goto :goto_0
.end method
